/*******************************************************************************
* MyMiniProjet                                                                 *
********************************************************************************
* Description:                                                                 *
* Functions to control the Robot of the MiniProjet 2.0                         *
********************************************************************************
* Version : 1.00 - July 2011                                                   *
*******************************************************************************/

#define  MyMiniProjet

#include "MyApp.h"

// SPI addresses of MTL touch registers (see MySPI.h)


unsigned int lastGesture = 0;
unsigned int posX, posY, screenColor;

void MyMiniProjet_Task() // void if no screenColor demo
{
    char message[50];
    lastGesture = (unsigned int)MyCyclone_Read(BASE_GESTUREINFO);
        if (lastGesture>>7) // if touch was active
        {
            // also send position
            posX = MyCyclone_Read(BASE_XPOS);
            posX += ((lastGesture>>2)&0x03)<<8; //take lastGesture[3:2] (=MSB) by shift & mask, then shift 8 bits
            posY = MyCyclone_Read(BASE_YPOS);
            posY += ((lastGesture>>1)&0x01)<<8;
            sprintf(message,"Gesture detected : %x --- position is (%d,%d)\n",lastGesture,posX,posY);
            MyConsole_SendMsg(message);
            
            // only for screencolor demo
            screenColor = posX/267;
            struct Image image;
            image.color_r = (screenColor==0)*255;
            image.color_g = (screenColor==1)*255;
            image.color_b = (screenColor==2)*255;
            MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast, (void *) &image , myMIWI_LTDemo , sizeof(struct Image));
        }
     
    
    // works if we send the gesture register directly
    // Detects a gesture (only if "no gesture") and prints a message showing the gesture in question
    /*char message[30];
    lastGesture = (unsigned int)MyCyclone_Read(0x07);
        if (lastGesture)
        {
            sprintf(message,"Gesture detected : %x\n",lastGesture);
            MyConsole_SendMsg(message);
        }
     */
}

/******************************************************************************/

