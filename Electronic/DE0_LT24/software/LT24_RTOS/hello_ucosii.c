/*************************************************************************
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.      *
* All rights reserved. All use of this software and documentation is     *
* subject to the License Agreement located at the end of this file below.*
**************************************************************************
* Description:                                                           *
* The following is a simple hello world program running MicroC/OS-II.The * 
* purpose of the design is to be a very simple application that just     *
* demonstrates MicroC/OS-II running on NIOS II.The design doesn't account*
* for issues such as checking system call return codes. etc.             *
*                                                                        *
* Requirements:                                                          *
*   -Supported Example Hardware Platforms                                *
*     Standard                                                           *
*     Full Featured                                                      *
*     Low Cost                                                           *
*   -Supported Development Boards                                        *
*     Nios II Development Board, Stratix II Edition                      *
*     Nios Development Board, Stratix Professional Edition               *
*     Nios Development Board, Stratix Edition                            *
*     Nios Development Board, Cyclone Edition                            *
*   -System Library Settings                                             *
*     RTOS Type - MicroC/OS-II                                           *
*     Periodic System Timer                                              *
*   -Know Issues                                                         *
*     If this design is run on the ISS, terminal output will take several*
*     minutes per iteration.                                             *
**************************************************************************/
/*
 *  Created on: Feb 25, 2016
 *      Author: obronchain
 */


/*#include "terasic_lib/terasic_includes.h"
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


int game_over( alt_video_display Display,TOUCH_HANDLE *pTouch , char *str);
int hardware( TOUCH_HANDLE *pTouch);
int counter = 0 ;
char LT24_state = 0;

alt_video_display Display;
TOUCH_HANDLE *pTouch;

void LT24_ISR(void *context){
	IOWR(LT24_INTERFACE_IRQ_0_BASE + (4*7),0 , 321);
	counter++;
	char *LT24 = (char* ) context;
	char str[64];
	*LT24 = 1;
}


int main(void)
{
	Clr_BUFFER_FLAG();
	unsigned int X, Y;
	unsigned int posTamper =0;

	int reg_ret = alt_iic_isr_register(LT24_INTERFACE_IRQ_0_IRQ_INTERRUPT_CONTROLLER_ID,
										LT24_INTERFACE_IRQ_0_IRQ,
										&LT24_ISR , (void *)&LT24_state , NULL);
	if(!reg_ret) {
		printf("Button interrupt service routine (ISR) well registered \n");
	} else {
		printf("Something went wrong in the registering; software exits");
		return 1;
	}
	 Clr_BUFFER_FLAG()Clr_BUFFER_FLAGClr_BUFFER_FLAG;


	IOWR(LT24_INTERFACE_IRQ_0_BASE+ (4*3),0, -1);
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0,-1);

	bool bSuccess;

    bSuccess = ADXL345_SPI_Init(GSENSOR_SPI_BASE);
    if(bSuccess)
    	printf("error init gsensor\n");

	printf("Welcome to LT24 Demo \n");

	// Write 0x3C on LED[6:0] through the dedicated custom IP
	IOWR(LED_CTRL_BASE, 0x0, 0x3C);
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 0);


	// TOUCH INITIALIZATION
	pTouch = Touch_Init(LT24_TOUCH_SPI_BASE,  LT24_TOUCH_PENIRQ_N_BASE, LT24_TOUCH_PENIRQ_N_IRQ);
	if (!pTouch){
		printf("Failed to init touch\r\n");
	}else{
		printf("Init touch successfully\r\n");
	}

	// LCD INITIALIZATION
	LCD_Init();
	hardware(pTouch);

	while(1){
		printf("LT24_state: %d\n" , LT24_state);

		if(LT24_state == 0)
			hardware(pTouch);
		else if(LT24_state==1){
			char str[64];
			sprintf(str , "Touch the screen %d \n" , counter);
			game_over(Display , pTouch , str );
			LT24_state = 0;
		}
	}

	return 0;
}


int hardware( TOUCH_HANDLE *pTouch){
	Set_BUFFER_FLAG();
	unsigned int X, Y;
	unsigned int posTamper =0;
	while(LT24_state==0){
		 if(Touch_GetXY(pTouch, &X, &Y) && LT24_state==0){
			 LCD_WR_DATA(Y);
			 LCD_WR_REG(X);
		 }
		 if(IORD_32DIRECT(LT24_INTERFACE_IRQ_0_BASE,0)){
			 return 0;
		 }

		    alt_16 szXYZ[3];
		    if (ADXL345_SPI_IsDataReady(GSENSOR_SPI_BASE) && ADXL345_SPI_XYZ_Read(GSENSOR_SPI_BASE, szXYZ)){
		    	if( szXYZ[0] < 512 && szXYZ[0]> -512 && szXYZ[1] < 512 && szXYZ[1]>-512){
		    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0, -szXYZ[0]/50);
		    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*3),0, -szXYZ[1]/50);
		    	}
		    	printf("Accel %d \n", szXYZ[0]);
		    }
	}

	printf("out of hardware \n");
	return 0;
}

int game_over( alt_video_display Display ,TOUCH_HANDLE *pTouch , char *str){
	 Clr_BUFFER_FLAG();
	 Display.interlace = 0;
	 Display.bytes_per_pixel = 2;
	 Display.color_depth = 16;
	 Display.height = SCREEN_HEIGHT;
	 Display.width = SCREEN_WIDTH;
	 vid_draw_box (0, 0,SCREEN_WIDTH, SCREEN_HEIGHT, 0x00f80000, 1, &Display);
	 vid_print_string_alpha(0, 0, 0xff00ff, 0xffffff, tahomabold_20, &Display, str);
	 unsigned int X, Y;
	 while(1){
		 if(Touch_GetXY(pTouch, &X, &Y) && LT24_state==1){
			 return 0;
		 }
	 }
	 return 0;
}

/*int hardware( TOUCH_HANDLE *pTouch){
	Set_BUFFER_FLAG();
	unsigned int X, Y;
	unsigned int posTamper =0;
	while(LT24_state==0){
		 if(Touch_GetXY(pTouch, &X, &Y) && LT24_state==0){
			 LCD_WR_DATA(Y);
			 LCD_WR_REG(X);
		 }
		 if(IORD_32DIRECT(LT24_INTERFACE_IRQ_0_BASE,0)){
			 return 0;
		 }

		    alt_16 szXYZ[3];
		    if (ADXL345_SPI_IsDataReady(GSENSOR_SPI_BASE) && ADXL345_SPI_XYZ_Read(GSENSOR_SPI_BASE, szXYZ)){
		    	if( szXYZ[0] < 512 && szXYZ[0]> -512 && szXYZ[1] < 512 && szXYZ[1]>-512){
		    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0, -szXYZ[0]/50);
		    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*3),0, -szXYZ[1]/50);
		    	}
		    	printf("Accel %d \n", szXYZ[0]);
		    }
	}

	printf("out of hardware \n");
	return 0;
}
*/

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


/* Definition of Task Stacks*/
#define   TASK_STACKSIZE       2048
OS_STK    task_send_data_stk[TASK_STACKSIZE];
OS_STK    task_game1_stk[TASK_STACKSIZE];
OS_STK    task_game2_stk[TASK_STACKSIZE];
OS_STK    task_game_over_stk[TASK_STACKSIZE];

/* Definition of Task Priorities*/
#define TASK_SEND_DATA_PRIORITY   	1
#define TASK_GAME1_PRIORITY      	2
#define TASK_GAME2_PRIORITY      	4
#define TASK_GAME_OVER_PRIORITY 	3

#define DELAY	5

/* Semaphores */
OS_EVENT *Game1;
OS_EVENT *Game2;
OS_EVENT *Game_Over;

/* MaiBoxes */
OS_EVENT *Accel;
OS_EVENT *Flag1;
OS_EVENT *Flag2;
OS_EVENT *touchX;
OS_EVENT *touchY;
OS_EVENT *irq_msg;

void task_send_data(void* pdata);
void task_game1(void* pdata);
void task_game2(void* pdata);
void task_game_over(void* pdata);
int init();

int counter = 0 ;
char LT24_state = 0;

alt_video_display Display;
TOUCH_HANDLE *pTouch;

void LT24_ISR(void *context){
	IOWR(LT24_INTERFACE_IRQ_0_BASE + (4*7),0 , 321);
	counter++;
	Clr_BUFFER_FLAG();
	OSSemPost(Game_Over);
	OSMboxPost(irq_msg , (void*)&counter);
	printf("lol");
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
	Game1 = OSSemCreate(1);
	Game2 = OSSemCreate(0);
	Game_Over = OSSemCreate(0);

	Accel = OSMboxCreate((void *)0);
	touchX = OSMboxCreate((void *)0);
	touchY = OSMboxCreate((void *)0);
	Flag1 = OSMboxCreate((void*)0);
	Flag2 = OSMboxCreate((void*)0);
	irq_msg = OSMboxCreate((void*)0);

	return 0;
}


/* The main function creates two task and starts multi-tasking*/
int main(void)
{
	init();

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

	OSTaskCreateExt(task_game2,
			NULL,
			(void *)&task_game2_stk[TASK_STACKSIZE-1],
			TASK_GAME2_PRIORITY,
			TASK_GAME2_PRIORITY,
			task_game2_stk,
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
		 OSSemPend(Game_Over, 0,&err);
		 Clr_BUFFER_FLAG();
		 printf("in gameover1 \n");

		 X = (unsigned int *)OSMboxPend(touchX , 0 , &err);
		 Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);


		 Display.interlace = 0;
		 Display.bytes_per_pixel = 2;
		 Display.color_depth = 16;
		 Display.height = SCREEN_HEIGHT;
		 Display.width = SCREEN_WIDTH;

		 vid_draw_box (0, 0,SCREEN_WIDTH, SCREEN_HEIGHT, 0x00f80000, 1, &Display);
		 vid_print_string_alpha(0, 0, 0xff00ff, 0xffffff, tahomabold_20, &Display, "hello");

		 X = (unsigned int *)OSMboxPend(touchX , 0 , &err);
		 Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);


		 Set_BUFFER_FLAG();
		 OSTimeDly(DELAY);
	 }
}
/* Used  to send data from touch or accel to the mailboxes*/
void task_send_data(void* pdata)
{
	unsigned int X, Y;
	alt_16 szXYZ[3];
	char *running_game;
	char game_on = 1;
	int cnt = 0;

	while(1){
		if(Touch_GetXY(pTouch, &X, &Y) && LT24_state==0){
			OSMboxPost(touchY , (void*)&Y);
			OSMboxPost(touchX , (void*)&X);
		}
	    if (ADXL345_SPI_IsDataReady(GSENSOR_SPI_BASE) && ADXL345_SPI_XYZ_Read(GSENSOR_SPI_BASE, szXYZ)){
	    	OSMboxPost(Accel , (void*) szXYZ);
	    }
		OSTimeDly(DELAY);
		running_game = (char *)OSMboxAccept(irq_msg);

		if(running_game != NULL){
			if(game_on == 0){
				OSMboxPost(Flag2 , (void*) &game_on);
				OSSemPost(Game1);
				game_on = 1;
			}
			else{
				OSMboxPost(Flag1 , (void*) &game_on);
				OSSemPost(Game2);
				game_on = 0;
			}
		}

	}
}

/* Used for hardware game1
 * Readdata from mailbox and send it to hardware*/
void task_game1(void* pdata)
{
	Set_BUFFER_FLAG();
    alt_16 *szXYZ;
    int err;
    char *msg;
    bool flag;

    while(1){
    	flag = 1;
    	printf("before Game1 pend\n");
    	OSSemPend(Game1 , 0 , &err);
    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 1);
    	printf("after Game1 pend\n");
    	while(flag){
    		printf("running 1\n");
    		szXYZ = (alt_16 *) OSMboxPend(Accel , 0 , &err);
    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0, -szXYZ[0]/50);
    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*3),0, -szXYZ[1]/50);
    		OSTimeDly(DELAY);

    		msg = (char *)OSMboxAccept(Flag1);
    		if(msg != NULL)
    			flag = 0;
    	}
	}
}

/* Used for hardware game1
 * Readdata from mailbox and send it to hardware*/
void task_game2(void* pdata)
{
	Set_BUFFER_FLAG();
    alt_16 *szXYZ;
	unsigned int *X, *Y;
    int err;
    bool flag;
    char *msg;

    while(1){
    	unsigned int *X, *Y;
    	OSSemPend(Game2 , 0 , &err);
    	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 0);
    	flag = 1;
		while(flag){
			printf("running 2\n");
			X = (unsigned int *)OSMboxPend(touchX , 0 , &err);
			Y = (unsigned int *)OSMboxPend(touchY , 0 , &err);
			LCD_WR_DATA(*Y);
			LCD_WR_REG(*X);

			msg = (char *)OSMboxAccept(Flag2);
			if(msg != NULL)
				flag = 0;

			OSTimeDly(DELAY);
		}
	}
}
