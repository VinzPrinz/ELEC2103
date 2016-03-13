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
	 Clr_BUFFER_FLAG();


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
OS_STK    task1_stk[TASK_STACKSIZE];
OS_STK    task2_stk[TASK_STACKSIZE];

/* Definition of Task Priorities*/

#define TASK1_PRIORITY      1
#define TASK2_PRIORITY      2

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

/* Prints "Hello World" and sleeps for three seconds*/
void task1(void* pdata)
{
  while (1)
  { 
    printf("Hello from task1\n");
    OSTimeDlyHMSM(0, 0, 3, 0);
  }
}
/* Prints "Hello World" and sleeps for three seconds*/
void task2(void* pdata)
{
  while (1)
  { 
    printf("Hello from task2\n");
    OSTimeDlyHMSM(0, 0, 3, 0);
  }
}
/* The main function creates two task and starts multi-tasking*/
int main(void)
{
  
  OSTaskCreateExt(task1,
                  NULL,
                  (void *)&task1_stk[TASK_STACKSIZE-1],
                  TASK1_PRIORITY,
                  TASK1_PRIORITY,
                  task1_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);
              
               
  OSTaskCreateExt(task2,
                  NULL,
                  (void *)&task2_stk[TASK_STACKSIZE-1],
                  TASK2_PRIORITY,
                  TASK2_PRIORITY,
                  task2_stk,
                  TASK_STACKSIZE,
                  NULL,
                  0);
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
	 Clr_BUFFER_FLAG();


	IOWR(LT24_INTERFACE_IRQ_0_BASE+ (4*3),0, -1);
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0,-1);

	bool bSuccess;

  bSuccess = ADXL345_SPI_Init(GSENSOR_SPI_BASE);
  if(bSuccess)
  	printf("error init gsensor\n");

	printf("Welcome to LT24 Demo \n");

	// Write 0x3C on LED[6:0] through the dedicated custom IP
	IOWR(LED_CTRL_BASE, 0x0, 0x3C);
	IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*2),0, 1);


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

  OSStart();
  return 0;
}

/*int game_over( alt_video_display Display ,TOUCH_HANDLE *pTouch , char *str){
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
}*/

/******************************************************************************
*                                                                             *
* License Agreement                                                           *
*                                                                             *
* Copyright (c) 2004 Altera Corporation, San Jose, California, USA.           *
* All rights reserved.                                                        *
*                                                                             *
* Permission is hereby granted, free of charge, to any person obtaining a     *
* copy of this software and associated documentation files (the "Software"),  *
* to deal in the Software without restriction, including without limitation   *
* the rights to use, copy, modify, merge, publish, distribute, sublicense,    *
* and/or sell copies of the Software, and to permit persons to whom the       *
* Software is furnished to do so, subject to the following conditions:        *
*                                                                             *
* The above copyright notice and this permission notice shall be included in  *
* all copies or substantial portions of the Software.                         *
*                                                                             *
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR  *
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,    *
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE *
* AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER      *
* LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING     *
* FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER         *
* DEALINGS IN THE SOFTWARE.                                                   *
*                                                                             *
* This agreement shall be governed in all respects by the laws of the State   *
* of California and by the laws of the United States of America.              *
* Altera does not recommend, suggest or require that this reference design    *
* file be used in conjunction or combination with any other product.          *
******************************************************************************/
