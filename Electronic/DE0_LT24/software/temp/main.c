/*
 * Author : L. Moreau, A. Willème 2016
 *
 * Based on Terasic LT24 Painter's demo
 *
 */

#include "terasic_lib/terasic_includes.h"
#include "terasic_lib/touch_spi.h"
#include "graphic_lib/alt_video_display.h"
#include "graphic_lib/ILI9341.h"
#include "demo/gui.h"

#define SENSE 100

int main()
{
Clr_BUFFER_FLAG();

 alt_video_display Display;
 TOUCH_HANDLE *pTouch;

 printf("Hi There !\n");

 // Write 0x3C on LED[6:0] through the dedicated custom IP
 IOWR(LED_CTRL_BASE, 0x0, 0x3C);

 // TOUCH INITIALIZATION
 pTouch = Touch_Init(LT24_TOUCH_SPI_BASE,  LT24_TOUCH_PENIRQ_N_BASE, LT24_TOUCH_PENIRQ_N_IRQ);
 if (!pTouch){
	 printf("Failed to init touch\r\n");
 }else{
	 printf("Init touch successfully\r\n");
 }

 // LCD INITIALIZATION
 LCD_Init();

 // Pattern example
 //LCD_Pattern_Horizon();
 // Sleep 3s
 //usleep(3*1000*1000);

 Set_BUFFER_FLAG();

 unsigned int X, Y;
 unsigned int X1 = 0;
 unsigned int Y1 = 0; // X1, Y1 : position where user left touch
 unsigned int X2 = 0;
 unsigned int Y2 = 0;
 int dirX = 0;
 int dirY = 0; // direction of the cat
 X = 10;
 Y = 10;
 unsigned divider = 0;
 unsigned int posTamper =0;
 while(1){
	 if(Touch_GetXY(pTouch, &X, &Y)){
		 //printf("X: %d Y: %d\n",X,Y);
		 LCD_WR_DATA(Y);
		 LCD_WR_REG(X);

		 // update the positions :)
		 X2 = X1;
		 Y2 = Y1;
		 X1 = X;
		 Y1 = Y;

		 // update
		 if(((int)(X1-X2) < 100) && ((int)(X1-X2) > -100))
			 dirX = (X1-X2);
		 if(((int)(Y1-Y2) < 100) && ((int)(Y1-Y2) > -100))
			 dirY = (Y1-Y2);

		 //we can modify the character (the image become progressively red when we touch it), we might do the same for the background
		 //IOWR_16DIRECT(PIC_MEM_BASE,posTamper,0xF800);
		 //posTamper++;

	 }
	 else if (divider==0)
	 {
		 X+=dirX;
		 Y+=dirY;
		 LCD_WR_DATA(Y);
		 LCD_WR_REG(X);
		 divider = 50000;
	 }
	 divider--;

	 // check if the cat goes outside the screen : make it bounce back
	 if (((int)Y>SCREEN_HEIGHT && dirY > 0) || (((int)Y)<20 && dirY < 0))
	 {
		 dirY = -dirY;
	 }
	 if (((int)X>SCREEN_WIDTH && dirX > 0) || (((int)X)<20 && dirX < 0))
	 {
	 	 dirX = -dirX;
	 }
 }

 // Painter demo
// Clr_BUFFER_FLAG();
// Display.interlace = 0;
// Display.bytes_per_pixel = 2;
// Display.color_depth = 16;
// Display.height = SCREEN_HEIGHT;
// Display.width = SCREEN_WIDTH;
// GUI(&Display, pTouch);

 return 0;
}
