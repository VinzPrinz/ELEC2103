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

#define myCyclone_Start_Fight    	1
#define myCyclone_End_Fight      	2
#define myCyclone_Start_Coin    	3
#define myCyclone_End_Coin       	4
#define myCyclone_Wait			 	5
#define myCyclone_Snake_Right    	9
#define myCyclone_Snake_Left     	10
#define myCyclone_Snake_Up       	11
#define myCyclone_Snake_Down     	12
#define myCyclone_Start_Snake    	13
#define myCyclone_End_Snake 		14
#define myCyclone_Start_Fight2    	15

#define myCyclone_Opp_Addr 			0x12

#define LT24_mode_Fight1			0
#define LT24_mode_Coins				1
#define LT24_mode_Snake				2
#define LT24_mode_Fight2			3


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
int Snake1I = 0;
int Snake1J = 0;
int Snake2I = 10;
int Snake2J = 10;

alt_video_display Display;
TOUCH_HANDLE *pTouch;
void sendSnake();
void clearSnake();
void updateSnake(int firstTime);

void LT24_ISR(void *context){
	// reset the LT24_buffer
	IOWR(LT24_INTERFACE_IRQ_0_BASE + (4*7),0 , 0);

	// get the timer
	int cnt = IORD(COUNTER_0_BASE,0);

	char str[64];
	counter++;

	if(Operation == myCyclone_Start_Coin ||Operation == myCyclone_End_Fight){
		coins ++;
		myOp = myCyclone_Start_Coin;
	}
	else if (Operation == myCyclone_Start_Fight || Operation == myCyclone_End_Coin || Operation == myCyclone_Start_Fight2){
		myOp = myCyclone_Wait;
	}
	if(Operation == myCyclone_Start_Fight){
		int tosend = cnt/(256*256*32);
		tosend = (tosend==0) ? 1 : tosend;
		IOWR(CYCLONESPI_BASE+(4*0x02) , 0 ,tosend);
		myOp = myCyclone_Start_Coin;
	}
	else if(Operation == myCyclone_Start_Fight2){
		int tosend = cnt/(256*256*64); // 256*256
		tosend = (tosend==0) ? 1 : tosend;
		IOWR(CYCLONESPI_BASE+(4*0x02) , 0 ,tosend);
		myOp = myCyclone_Start_Coin;
	}

	OSMboxPost(Flag2, (void*)&myOp);
	Clr_BUFFER_FLAG();

}

int init(){
	Clr_BUFFER_FLAG();

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
		vid_print_string_alpha(0, 0, 0xff00ff, 0xffffff, tahomabold_20, &Display, "Next Turn");

		int *lol = (int *)OSMboxPend(GameOverBox , 0 , &err);
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
		//Send the data from touch to task
		if(Touch_GetXY(pTouch, &X, &Y)){
			OSMboxPost(touchY , (void*)&Y);
			OSMboxPost(touchX , (void*)&X);
		}

		//Send the data from accelerometer to task
		if (ADXL345_SPI_IsDataReady(GSENSOR_SPI_BASE) && ADXL345_SPI_XYZ_Read(GSENSOR_SPI_BASE, szXYZ)){
				OSMboxPost(Accel , (void*) szXYZ);
		}

		OSTimeDly(DELAY);

		// retreiving the operation from pic32
		previousOp = newOp;
		newOp = IORD(CYCLONESPI_BASE+(4*myCyclone_Opp_Addr),0); // read the op asked by pic32
		int *opIrq = (int *)OSMboxAccept(Flag2); // read the op from irq



		if (newOp != Operation && newOp != previousOp && newOp !=0){
			printf("new op %d \n" , newOp);
			IOWR(CYCLONESPI_BASE+(4*myCyclone_Opp_Addr),0 , 0); // read the op asked by pic32
			switch(newOp){
			case myCyclone_Start_Fight: OSSemPost(Game2);game_on = 0;
				restartcoin = (Operation == myCyclone_Start_Coin);
				IOWR(CYCLONESPI_BASE+(4*0x03) , 0 , coins);
				coins =0;
				break;
			case myCyclone_Start_Fight2: OSSemPost(Game2); game_on = 0;
				restartcoin = (Operation == myCyclone_Start_Coin);
				IOWR(CYCLONESPI_BASE+(4*0x03) , 0 , coins);
				coins =0;
				break;
			case myCyclone_Start_Coin: OSSemPost(Game1); game_on = 1;
				coins= (opIrq!=NULL) ? coins : 0;
				break;
			case myCyclone_End_Coin: IOWR(CYCLONESPI_BASE+(4*0x03) , 0 , coins);
				coins =0;
				break;
			case myCyclone_Start_Snake:	OSSemPost(Game2); game_on = 0;
				restartcoin = (Operation == myCyclone_Start_Coin);
				IOWR(CYCLONESPI_BASE+(4*0x03) , 0 , coins);
				coins =0;
				clearSnake();
				break;
			default:OSSemPost(Game1); game_on = 1;
				break;
			}

			// there is a new op from the irq handler
			if(opIrq != NULL)
				newOp = *opIrq;

			OSMboxPost(Flag1 , (void*) &newOp);
			Operation = newOp;

			// Send the new operation to GameOver Task meaning to stop his task
			if( newOp == myCyclone_Start_Fight || newOp==myCyclone_Start_Fight2 || newOp == myCyclone_Start_Coin || newOp == myCyclone_Start_Snake){
				OSMboxPost(GameOverBox , (void *)&Operation);
			}

		}else if(opIrq !=NULL){
			OSMboxPost(Flag1 , (void*) opIrq);
			if(Operation == myCyclone_End_Fight || Operation == myCyclone_Start_Fight || Operation== myCyclone_Start_Fight2 || Operation == myCyclone_Start_Snake || Operation == myCyclone_End_Snake)
				OSMboxPost(GameOverBox , (void *)&Operation);

			Operation = *opIrq;
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


	// show the default speed of the coin
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*9),0 , 0);
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*10),0 , 0);

	srand(time(NULL)); // initialisation of rand


	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*7),0 , rand() % 220);
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*8),0 , rand() % 300);

	while(1){
		op = NULL;
		OSSemPend(Screen , 0 , &err);
		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 1); // select the first game

		Set_BUFFER_FLAG();

		while(op==NULL || *op == myCyclone_Start_Coin || *op == myCyclone_Start_Fight || *op == myCyclone_Start_Fight2 || *op == myCyclone_End_Fight || *op == myCyclone_Start_Snake || *op == myCyclone_End_Snake){

			int vx = IORD(LT24_INTERFACE_IRQ_0_BASE+(4*5),0);
			int vy = IORD(LT24_INTERFACE_IRQ_0_BASE+(4*6),0);

			// if statement to init the games
			if(op != NULL && *op == myCyclone_Start_Coin ){
				// set mode to the screen
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, LT24_mode_Coins);

				// set random position
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*7),0 , rand() % 220);
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*8),0 , rand() % 300);

				// set random speed to the coin
				int vx = rand()%3 -1;
				int vy = rand()%3 -1;
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*9),0 , vx);
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*10),0 , vy);

				Clr_BUFFER_FLAG();
				Set_BUFFER_FLAG();
				acctualOp = *op;
			}
			else if (op!=NULL && *op==myCyclone_Start_Fight){
				// set mode to the screen
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, LT24_mode_Fight1);

				// reset the counter
				IOWR(COUNTER_0_BASE+8, 0 , 0);

				// clear the screen
				Clr_BUFFER_FLAG();
				Set_BUFFER_FLAG();

				// clean the touch buffer
				X = (unsigned int *)OSMboxPend(touchX , 0 , &err);
				Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);

				acctualOp = *op;
			}
			else if (op!=NULL && *op==myCyclone_Start_Fight2){
				// set mode to the screen
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, LT24_mode_Fight2);

				// send random pattern
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*11),0, rand()%4000 + 500 ); /// PATTERN  3

				// reset the counter
				IOWR(COUNTER_0_BASE+8, 0 , 0);

				// clear the screen
				Clr_BUFFER_FLAG();
				Set_BUFFER_FLAG();

				// clean the touch buffer
				X = (unsigned int *)OSMboxPend(touchX , 0 , &err);
				Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);

				acctualOp = *op;
			}
			else if (op != NULL && *op == myCyclone_Start_Snake){
				//set the mode to the screen
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, LT24_mode_Snake);

				// clear the snake game (Snake[][])
				clearSnake();

				// set random position to the snake
				Snake1J = (rand() % 28) +2;
				Snake1I = (rand() % 20) +2;
				Snake2J = (rand() % 28) +2;
				Snake2I = (rand() % 20) +2;
				updateSnake(1);

			}


			// this if statement is to play normaly the game
			if(acctualOp == myCyclone_Start_Coin || acctualOp == myCyclone_End_Fight || acctualOp == myCyclone_End_Snake){
				// send to data from accel to the screen
				szXYZ = (alt_16 *) OSMboxPend(Accel , 0 , &err);
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0, -szXYZ[0]/50);
				IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*3),0, -szXYZ[1]/50);
			}
			else if (acctualOp == myCyclone_Start_Fight || acctualOp==myCyclone_Start_Fight2){

				// send the data from touch to the screen if new
				X = (unsigned int *)OSMboxAccept(touchX);
				if(X !=NULL){
					Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);
					LCD_WR_DATA(*Y);
					LCD_WR_REG(*X);
				}

			}
			else if(acctualOp == myCyclone_Start_Snake){
				updateSnake(0);
			}

			OSTimeDly(DELAY);

			op = (int *)OSMboxAccept(Flag1);
			if(op != NULL){
				acctualOp = *op;
			}
		}

		OSSemPost(Screen);
		OSTimeDly(DELAY);
	}
}

void checkSnake(int j , int i , int snake){
	if(Snake[j][i]!=0){
		OSMboxPost(Flag2, (void*)&myOp);
		IOWR(CYCLONESPI_BASE+(4*0x08) , 0 ,snake);
	}
}


/*
 * check if touch a boarder of the screen, if yes, change operation
 */
void boarderSnake(int j , int i  ,int dir, int snake){

	if(dir == myCyclone_Snake_Right && i == 23){
		OSMboxPost(Flag2, (void*)&myOp);
		IOWR(CYCLONESPI_BASE+(4*0x08) , 0 ,snake);
	}

	if(dir == myCyclone_Snake_Left && i == 0){
		OSMboxPost(Flag2, (void*)&myOp);
		IOWR(CYCLONESPI_BASE+(4*0x08) , 0 , snake);
	}

	if(dir == myCyclone_Snake_Down && j == 31){
		OSMboxPost(Flag2, (void*)&myOp);
		IOWR(CYCLONESPI_BASE+(4*0x08) , 0 , snake);
	}


	if(dir == myCyclone_Snake_Up && j == 0){
		OSMboxPost(Flag2, (void*)&myOp);
		IOWR(CYCLONESPI_BASE+(4*0x08) , 0 , snake);
	}
}

/*
 * Check is the next is in possible or not. If possible, return the next dir
 * else return the oldone
 */
int dirCheck(int dir, int oldDir){
	if(dir == myCyclone_Snake_Right && oldDir == myCyclone_Snake_Left)
		dir = oldDir;
	else if (dir == myCyclone_Snake_Left && oldDir ==myCyclone_Snake_Right)
		dir = oldDir;
	else if(dir == myCyclone_Snake_Down && oldDir == myCyclone_Snake_Up)
		dir = oldDir;
	else if (dir == myCyclone_Snake_Up && oldDir == myCyclone_Snake_Down)
		dir = oldDir;

	return dir;
}

void updateSnake(int firstTime){
	int dir1 , dir2;
	static int oldDir1 , oldDir2;

	// set the speed of the snakes
	OSTimeDlyHMSM(0, 0, 0, 400);

	dir1 = IORD(CYCLONESPI_BASE+(4*0x13),0); // read the dir asked by pic32
	dir2 = IORD(CYCLONESPI_BASE+(4*0x14),0); // read the dir asked by pic32

	if((dir1==0 ||dir2 == 0) && !firstTime){
		return;
	}

	dir1 = dirCheck(dir1 , oldDir1);
	dir2 = dirCheck(dir2 , oldDir2);

	oldDir1 = dir1;
	oldDir2 = dir2;

	boarderSnake(Snake1J , Snake1I , dir1 , 1);
	boarderSnake(Snake2J , Snake2I , dir2 , 2);


	if(Snake1I+1 < 24 && dir1 == myCyclone_Snake_Right){
		checkSnake(Snake1J , Snake1I+1 , 1);
		Snake1I++;
	}
	else if(Snake1I-1 >= 0 && dir1 == myCyclone_Snake_Left){
		checkSnake(Snake1J , Snake1I-1 , 1);
		Snake1I--;
	}

	if(Snake1J+1 < 32 && dir1 == myCyclone_Snake_Down){
		checkSnake(Snake1J+1 , Snake1I , 1);
		Snake1J++;
	}
	else if (Snake1J-1 >=0 && dir1 == myCyclone_Snake_Up){
		checkSnake(Snake1J-1 , Snake1I  , 1);
		Snake1J--;
	}

	if(Snake2I+1 < 24 && dir2 == myCyclone_Snake_Right){
		checkSnake(Snake2J , Snake2I+1 , 2);
		Snake2I++;
	}
	else if(Snake2I-1 >= 0 && dir2 == myCyclone_Snake_Left){
		checkSnake(Snake2J , Snake2I-1 , 2);
		Snake2I--;
	}

	if(Snake2J+1 < 32 && dir2 == myCyclone_Snake_Down){
		checkSnake(Snake2J+1 , Snake2I , 2);
		Snake2J++;
	}
	else if (Snake2J-1 >=0 && dir2 == myCyclone_Snake_Up){
		checkSnake(Snake2J-1 , Snake2I , 2 );
		Snake2J--;
	}

	Snake[Snake1J][Snake1I] = 1;
	Snake[Snake2J][Snake2I] = 2;
	sendSnake();

}


/*
 * Clear the Snake[][] and clear the LT24 screen
 */
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


/*
 * function to send Snake[][] to hardware in order
 * to display the snake on the LT24 screen
 */
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



