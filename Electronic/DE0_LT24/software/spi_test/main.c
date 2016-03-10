/*
 *  Created on: Feb 25, 2016
 *      Author: obronchain
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


int main()
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
		    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*4),0, -szXYZ[0]/100);
		    		IOWR(LT24_INTERFACE_IRQ_0_BASE+(4*3),0, -szXYZ[1]/100);
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
