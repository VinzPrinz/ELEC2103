#include "terasic_lib/terasic_includes.h"
#include "terasic_lib/touch_spi.h"
#include "graphic_lib/alt_video_display.h"
#include "graphic_lib/ILI9341.h"
#include "demo/gui.h"
#include "fonts/fonts.h"
#include "HAL/inc/priv/alt_iic_isr_register.h"
#include "altera_avalon_pio_regs.h"
#include "terasic_includes.h"
#include "accelerometer_adxl345_spi.h"
#include "io.h"
#include "includes.h"
#include <stdlib.h>
#include <time.h>

#define myCyclone_Start_Fight    1
#define myCyclone_End_Fight      2
#define myCyclone_Start_Coin     3
#define myCyclone_End_Coin       4
#define myCyclone_Wait			 5
#define myCyclone_Snake_Right       9
#define myCyclone_Snake_Left        10
#define myCyclone_Snake_Up          11
#define myCyclone_Snake_Down        12
#define myCyclone_Start_Snake 		13
#define myCyclone_End_Snake 		14




/* Definition of Task Stacks*/
#define   TASK_STACKSIZE       2048
OS_STK    task_send_data_stk[TASK_STACKSIZE];
OS_STK    task_game1_stk[TASK_STACKSIZE];
OS_STK    task_game2_stk[TASK_STACKSIZE];
OS_STK    task_game_over_stk[TASK_STACKSIZE];

/* Definition of Task Priorities*/
#define TASK_SEND_DATA_PRIORITY   	1
#define TASK_GAME1_PRIORITY      	3
#define TASK_GAME2_PRIORITY      	4
#define TASK_GAME_OVER_PRIORITY 	2

#define DELAY	5

/* Semaphores */
OS_EVENT *Game1;
OS_EVENT *Game2;
OS_EVENT *Game_Over;
OS_EVENT *Screen;

/* MaiBoxes */
OS_EVENT *Accel;
OS_EVENT *Flag1;
OS_EVENT *Flag2;
OS_EVENT *touchX;
OS_EVENT *touchY;
OS_EVENT *irq_msg;
OS_EVENT *GameOverBox;

void task_send_data(void* pdata);
void task_game1(void* pdata);
void task_game2(void* pdata);
void task_game_over(void* pdata);
int init();

int counter = 0 ;
char LT24_state = 0;
int Operation = myCyclone_Wait;
int coins=0;
int myOp;
bool restartcoin =0;

char Snake [32][24];
char Snake1I = 0;
char Snake1J = 0;
char Snake2I = 10;
char Snake2J = 10;

alt_video_display Display;
TOUCH_HANDLE *pTouch;
void sendSnake();
void clearSnake();
void updateSnake();

void LT24_ISR(void *context){
	IOWR(LT24_INTERFACE_IRQ_0_BASE + (4*7),0 , 321);
	int cnt = IORD(COUNTER_0_BASE,0);

	char str[64];
	sprintf(str , "||||||||||||||||||| This is counter %x  , %x \n" ,cnt ,  cnt/(256*256));
	printf(str);
	counter++;
	if(Operation == myCyclone_Start_Coin ||Operation == myCyclone_End_Fight){
		coins++;
		myOp = myCyclone_Start_Coin;
	}
	else if (Operation == myCyclone_Start_Fight || Operation == myCyclone_End_Coin){
		myOp = myCyclone_Wait;
	}
	if(Operation == myCyclone_Start_Fight){
		 IOWR(CYCLONESPI_BASE+(4*0x02) , 0 ,cnt/(256*256*32));
		 myOp = myCyclone_Start_Coin;
	}

	OSMboxPost(Flag2, (void*)&myOp);
	Clr_BUFFER_FLAG();

}

int init(){
	Clr_BUFFER_FLAG();

	// register irq
	int reg_ret = alt_iic_isr_register(LT24_INTERFACE_IRQ_0_IRQ_INTERRUPT_CONTROLLER_ID,
										LT24_INTERFACE_IRQ_0_IRQ,
										&LT24_ISR , (void *)&LT24_state , NULL);
	if(!reg_ret) {
		printf("Button interrupt service routine (ISR) well registered \n");
	} else {
		printf("Something went wrong in the registering; software exits");
		return -1;
	}

	// TOUCH INITIALIZATION
	pTouch = Touch_Init(LT24_TOUCH_SPI_BASE,  LT24_TOUCH_PENIRQ_N_BASE, LT24_TOUCH_PENIRQ_N_IRQ);
	if (!pTouch){
		printf("Failed to init touch\r\n");
		return -1;
	}else{
		printf("Init touch successfully\r\n");
	}


	bool bSuccess;

    bSuccess = ADXL345_SPI_Init(GSENSOR_SPI_BASE);
    if(!bSuccess)
    	printf("error init gsensor\n");

	// LCD INITIALIZATION
	LCD_Init();

	// OS_EVENT init
	Game1 = OSSemCreate(0);
	Game2 = OSSemCreate(0);
	Game_Over = OSSemCreate(0);
	Screen = OSSemCreate(1);

	Accel = OSMboxCreate((void *)0);
	touchX = OSMboxCreate((void *)0);
	touchY = OSMboxCreate((void *)0);
	Flag1 = OSMboxCreate((void*)0);
	Flag2 = OSMboxCreate((void*)0);
	irq_msg = OSMboxCreate((void*)0);
	GameOverBox = OSMboxCreate((void*)0);

	IOWR(LT24_INTERFACE_IRQ_0_BASE + (4*7),0 , 321);

	return 0;
}


/* The main function creates two task and starts multi-tasking*/
int main(void)
{
	init();
	clearSnake();


	OSTaskCreateExt(task_send_data,
			NULL,
			(void *)&task_send_data_stk[TASK_STACKSIZE-1],
			TASK_SEND_DATA_PRIORITY,
			TASK_SEND_DATA_PRIORITY,
			task_send_data_stk,
			TASK_STACKSIZE,
			NULL,
			0);

	OSTaskCreateExt(task_game1,
			NULL,
			(void *)&task_game1_stk[TASK_STACKSIZE-1],
			TASK_GAME1_PRIORITY,
			TASK_GAME1_PRIORITY,
			task_game1_stk,
			TASK_STACKSIZE,
			NULL,
			0);

	OSTaskCreateExt(task_game_over,
			NULL,
			(void *)&task_game_over_stk[TASK_STACKSIZE-1],
			TASK_GAME_OVER_PRIORITY,
			TASK_GAME_OVER_PRIORITY,
			task_game_over_stk,
			TASK_STACKSIZE,
			NULL,
			0);
	printf("OS state\n");
	OSStart();
	return 0;
}

/* Used to do the game Over*/
void task_game_over(void* pdata)
{

	 unsigned int *X, *Y;
	 int err;

	 while(1){
		 OSSemPend(Screen, 0,&err);
		 Clr_BUFFER_FLAG();

		 Display.interlace = 0;
		 Display.bytes_per_pixel = 2;
		 Display.color_depth = 16;
		 Display.height = SCREEN_HEIGHT;
		 Display.width = SCREEN_WIDTH;

		 vid_draw_box (0, 0,SCREEN_WIDTH, SCREEN_HEIGHT, 0x00f80000, 1, &Display);
		 vid_print_string_alpha(0, 0, 0xff00ff, 0xffffff, tahomabold_20, &Display, "hello");


		 int *lol = (int *)OSMboxPend(GameOverBox , 0 , &err);
		 printf("Game over end \n");
		 OSSemPost(Screen);

		 OSTimeDly(DELAY);
	 }
}
/* Used  to send data from touch or accel to the mailboxes*/
void task_send_data(void* pdata)
{
	unsigned int X, Y;
	alt_16 szXYZ[3];
	char game_on = 1;

	Clr_BUFFER_FLAG();
	int previousOp = 1;
	int newOp = 0;
	int dir = 255;

	while(1){
		if(Touch_GetXY(pTouch, &X, &Y)){
			OSMboxPost(touchY , (void*)&Y);
			OSMboxPost(touchX , (void*)&X);
		}
	    if (ADXL345_SPI_IsDataReady(GSENSOR_SPI_BASE) && ADXL345_SPI_XYZ_Read(GSENSOR_SPI_BASE, szXYZ)){
	    	OSMboxPost(Accel , (void*) szXYZ);
	    }

		OSTimeDly(DELAY);

		previousOp = newOp;
		newOp = IORD(CYCLONESPI_BASE+(4*0x12),0); // read the op asked by pic32
		int *opIrq = (int *)OSMboxAccept(Flag2);

		if (newOp != Operation && newOp != previousOp && newOp !=0 && (Operation==myCyclone_Wait|| Operation == myCyclone_End_Fight || Operation == myCyclone_End_Coin || Operation == myCyclone_Start_Coin || Operation == myCyclone_End_Snake )){
			printf("in newOp %d \n" , newOp);
			switch(newOp){
				case myCyclone_Start_Fight: OSSemPost(Game2); game_on = 0;
											restartcoin = (Operation == myCyclone_Start_Coin);
											IOWR(CYCLONESPI_BASE+(4*0x03) , 0 , coins);
											 coins =0;
											break;
				case myCyclone_Start_Coin: OSSemPost(Game1); game_on = 1;
										   coins=0;
										   break;
				case myCyclone_End_Coin: //OSMboxPost(Flag1 , (void*)&game_on);
										 IOWR(CYCLONESPI_BASE+(4*0x03) , 0 , coins);
										 coins =0;
										 break;
				case myCyclone_Start_Snake:	clearSnake();
											break;
				default:OSSemPost(Game1); game_on = 1;
						break;
			}
			/// Force end of game over

			if(opIrq != NULL)
				newOp = *opIrq;

			if(Operation == myCyclone_Wait || Operation == myCyclone_End_Coin || newOp == myCyclone_Start_Fight || newOp == myCyclone_Start_Coin || newOp == myCyclone_Start_Snake){
				OSMboxPost(GameOverBox , (void *)&Operation);
				printf("poster to gameover \n");
			}

			if(opIrq == NULL){
				OSMboxPost(Flag1, (void*)&newOp);
				Operation = newOp;
				printf("posted to task game |||||||| new op %d \n" , newOp);
			}
			else{
				OSMboxPost(Flag1 , (void*) opIrq);
				Operation = *opIrq;
			}

		}else if(opIrq !=NULL){
			OSMboxPost(Flag1 , (void*) opIrq);
			if(Operation == myCyclone_End_Fight || Operation == myCyclone_Start_Fight || Operation == myCyclone_Start_Snake || Operation == myCyclone_End_Snake)
				OSMboxPost(GameOverBox , (void *)&Operation);

			Operation = *opIrq;
			printf("sended to task game %d  \n" , *opIrq);
		}
	}
}

/* Used for hardware games
 * Readdata from mailbox and send it to hardware*/
void task_game1(void* pdata)
{
    alt_16 *szXYZ;
    int err;
	unsigned int *X, *Y;
    int  *op;
    int acctualOp = myCyclone_Wait ;
    int dir;


	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*9),0 , 0); // set default speed to 1
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*10),0 , 0);

	srand(time(NULL)); // initialisation of rand
	Set_BUFFER_FLAG();
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*7),0 , rand() % 220);
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*8),0 , rand() % 300);

    while(1){
    	op = NULL;
    	OSSemPend(Screen , 0 , &err);
    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 1); // select the first game

    	printf("Started Game1\n");
		Set_BUFFER_FLAG();

    	while(op==NULL || *op == myCyclone_Start_Coin || *op == myCyclone_Start_Fight || *op == myCyclone_End_Fight || *op == myCyclone_Start_Snake || *op == myCyclone_End_Snake){

			int vx = IORD(LT24_INTERFACE_IRQ_0_BASE+(4*5),0);
			int vy = IORD(LT24_INTERFACE_IRQ_0_BASE+(4*6),0);

			if(op != NULL && *op == myCyclone_Start_Coin ){
			    			int vx = rand()%3 -1;
			    			int vy = rand()%3 -1;
			    			IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*9),0 , vx);
			    			IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*10),0 , vy);
			    	    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 1);
			    	    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*7),0 , rand() % 220);
			    	    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*8),0 , rand() % 300);
			    			Clr_BUFFER_FLAG();
			    			Set_BUFFER_FLAG();
			    			acctualOp = *op;
			    		}
			    		else if (op!=NULL && *op==myCyclone_Start_Fight){
			    			printf("init the fight \n");
			    	    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 3); /// PATTERN  3
			    	    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*11),0, rand()%4000 + 500 ); /// PATTERN  3

			    	    	IOWR(COUNTER_0_BASE+8, 0 , 0);
			    	    	int cnt = IORD(COUNTER_0_BASE,0);
			    	    	int i = 0;
			    	    	i ++;
			    	    	int cnt2 = IORD(COUNTER_0_BASE,0);
			    	    	printf("|||||||||||||||||||||||||cnt just after %d cnt2 %d|||||||||||||||||\n" ,cnt , cnt2);
			    	    	Clr_BUFFER_FLAG();
			    	    	Set_BUFFER_FLAG();
			    			X = (unsigned int *)OSMboxPend(touchX , 0 , &err);
			    			Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);

			    			acctualOp = *op;
			    		}
			    		else if (op != NULL && *op == myCyclone_Start_Snake){
			    	    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 2);
			    	    	clearSnake();
			    	    	Snake1J = 6 + rand() % 20;
			    	    	Snake1I = 4+ rand() % 16;
			    	    	printf(" ||||||||||||| clear Snake %d %d %d %d\n" , Snake1J , Snake1I);
			    		}
    		if(acctualOp == myCyclone_Start_Coin || acctualOp == myCyclone_End_Fight || acctualOp == myCyclone_End_Snake){
    			szXYZ = (alt_16 *) OSMboxPend(Accel , 0 , &err);
    			IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0, -szXYZ[0]/50);
    			IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*3),0, -szXYZ[1]/50);
    		}

    		else if (acctualOp == myCyclone_Start_Fight){
    			X = (unsigned int *)OSMboxAccept(touchX);
    			if(X !=NULL){
    				Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);
    				LCD_WR_DATA(*Y);
    				LCD_WR_REG(*X);
    			}
    		}
    		else if(acctualOp == myCyclone_Start_Snake){
    			updateSnake();
    		}

    		OSTimeDly(DELAY);



    		op = (int *)OSMboxAccept(Flag1);
    		if(op != NULL){
    			acctualOp = *op;
    			printf("this is op in task game %d \n" , *op);
    		}
    	}

    	OSSemPost(Screen);
		OSTimeDly(DELAY);
		printf("release game \n");
	}
}

void checkSnake(int j , int i){
	if(Snake[j][i]!=0)
		OSMboxPost(Flag2, (void*)&myOp);
}

void boarderSnake(int j , int i  ,int dir){

	if(dir == myCyclone_Snake_Right && i == 23)
		OSMboxPost(Flag2, (void*)&myOp);

	if(dir == myCyclone_Snake_Left && i == 0)
		OSMboxPost(Flag2, (void*)&myOp);

	if(dir == myCyclone_Snake_Down && j == 31)
		OSMboxPost(Flag2, (void*)&myOp);

	if(dir == myCyclone_Snake_Up && j == 0)
		OSMboxPost(Flag2, (void*)&myOp);
}

void updateSnake(){
	int dir;
	OSTimeDlyHMSM(0, 0, 0, 400);
	dir = IORD(CYCLONESPI_BASE+(4*0x14),0); // read the op asked by pic32

	printf("LOL0 Snake1J %d Snake1I %d \n"  , Snake1J , Snake1I);

	boarderSnake(Snake1J , Snake1I , dir);


	printf("LOL1 Snake1J %d Snake1I %d \n"  , Snake1J , Snake1I);
	if(Snake1I+1 < 24 && dir == myCyclone_Snake_Right){
		checkSnake(Snake1J , Snake1I+1);
		Snake1I++;
	}
	else if(Snake1I-1 >= 0 && dir == myCyclone_Snake_Left){
		checkSnake(Snake1J , Snake1I-1);
		Snake1I--;
	}
	printf("LOL2 Snake1J %d Snake1I %d \n"  , Snake1J , Snake1I);


	if(Snake1J+1 < 32 && dir == myCyclone_Snake_Down){
		checkSnake(Snake1J+1 , Snake1I);
		Snake1J++;
	}
	else if (Snake1J-1 >=0 && dir == myCyclone_Snake_Up){
		checkSnake(Snake1J-1 , Snake1I );
		Snake1J--;
	}
	printf("LOL2 Snake1J %d Snake1I %d \n"  , Snake1J , Snake1I);


	if(Snake2I+1 < 24)
		Snake2I++;

	Snake[Snake1J][Snake1I] = 1;
	Snake[Snake2J][Snake2I] = 2;
	sendSnake();

}


void clearSnake(){
	int i = 0;
	int j = 0;
	for( j =0 ; j<32 ; j++){
		for(i = 0; i <24; i++){
			Snake[j][i] = 0;
			IOWR(SNAKE_MEM_BASE, i + j*24 , 0x00000000);
		}
	}
}

void sendSnake(){
	int i = 0;
	int j = 0;
	int data;
	for(j =0 ; j<32 ; j++){

		data = 0;
		for(i = 0; i <16; i++){
			data += (Snake[j][i]==1) << i*2;
		}
		for(i = 0; i <16; i++){
			data += (Snake[j][i]==2) << i*2 +1;
		}
		IOWR(SNAKE_MEM_BASE, j*2  , data);

		data = 0;
		for(i = 16;i<24 ; i++){
			data += (Snake[j][i]==1) << (i%16)*2;
		}
		for(i = 16;i<24 ; i++){
			data += (Snake[j][i]==2) << (i%16)*2+1 ;
		}

		IOWR(SNAKE_MEM_BASE, j*2 +1 , data);

	}
}



