/*
 * main.c
 *
 *  Created on: 15 mars 2016
 *      Author: Prinz
 */

#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "terasic_lib/terasic_includes.h"

char MTL_state = 0;

// translates touch data to x,y and isTouched signals
void translateTouchData(int touchData, int* x, int* y, int* isTouched)
{
	*isTouched = touchData & 0x0001;
	*y = (touchData>>1) & 0x01FF; // take 9 bits
	*x = (touchData>>10) & 0x03FF; // take 10 bits
}

void sendMap(char theMap[8][16])
{
	int i,j;
	int data;
	for(i=0; i<4; i++) // send to 4 addresses
	{
		data = 0;
		// row 0
		for(j=0; j<16; j++)
		{
			data += (theMap[i*2][j] == 'X')<<j;
		}
		// row 1
		for(j=0; j<16; j++)
		{
			data += (theMap[i*2+1][j] == 'X')<<(j+16);
		}
		// send
		IOWR(MAPTRANSFER_BASE, i, data);
	}
}

// translate pixel coordinates x,y to tile coordinates
void translateToTiles(int x, int y, int* xTile, int* yTile)
{
	*xTile = x/50;
	*yTile = y/50; // TODO !!!! handle case where out of the map (menu) !!!
}

int manhattan(int x1, int y1, int x2, int y2)
{
	return abs(x1-x2) + abs(y1-y2);
}


void MTL_ISR(void *context){
	printf("this is the counter %d \n" , IORD(MTL_INTERFACE_IRQ_0_BASE+8 ,0 )); // read counter
	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x1);
	int i=  0;
	for(i;i<10000;i++)
	{}
	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x0);
}

int main()
{
	int test,x,y,isTouched;
	int tileX, tileY,selectX, selectY; // touched tile and selected tile (can only be a soldier)
	int receive = 0; // indicates when we receive data
	int lol = 1;
	printf("Hello from MTL side!\n");

	//IOWR(MTL_INTERFACE_IRQ_0_BASE , 0x0 , 0x1);

	IOWR(TESTLED_BASE, 0x0, 0x3);

	// create the map : '.' = empty, 'X' = perso
	char theMap[8][16] = {{'.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'},
						  {'.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'},
						  {'.','.','.','X','.','.','.','.','.','.','.','.','.','X','.','.'},
						  {'.','.','.','.','.','.','.','.','.','.','.','.','X','.','.','.'},
						  {'.','.','.','X','.','.','.','.','.','.','.','X','.','.','.','.'},
						  {'.','.','.','X','.','.','.','.','.','.','.','.','.','.','.','.'},
						  {'.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'},
						  {'.','.','.','.','.','.','.','.','.','.','.','.','.','X','.','.'}};
	sendMap(theMap);

// send the starting map in the beginning
//	IOWR(MAPTRANSFER_BASE, 0x0, 0x00000000);
//	IOWR(MAPTRANSFER_BASE, 0x1, 0x00000808);
//	IOWR(MAPTRANSFER_BASE, 0x2, 0x08080000);
//	IOWR(MAPTRANSFER_BASE, 0x2, 0x00000000);

	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x1);
	int i =0;
	for(i;i<10000;i++)
	{}
	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x0);

	int reg_ret = alt_iic_isr_register(MTL_INTERFACE_IRQ_0_IRQ_INTERRUPT_CONTROLLER_ID,
											MTL_INTERFACE_IRQ_0_IRQ,
										&MTL_ISR , (void *)&MTL_state , NULL);
	if(!reg_ret) {
		printf("Button interrupt service routine (ISR) well registered \n");
	} else {
		printf("Something went wrong in the registering; software exits");
		return -1;
	}


	while(1)
	{	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x0); // reset game;
		IOWR(MTL_INTERFACE_IRQ_0_BASE+4 , 0 , 0x2); // mode

		//printf("this is the counter %d \n" , IORD(MTL_INTERFACE_IRQ_0_BASE+8 ,0 )); // read counter

		test = IORD(TOUCHDATA_BASE, 0x0);
		translateTouchData(test, &x, &y, &isTouched);
		if(isTouched && !receive) // it is a new touch we sensed
		{
			translateToTiles(x, y, &tileX, &tileY);
			receive = 1;

			if (theMap[tileY][tileX] == 'X') // if we touched a soldier
			{
				selectX = tileX;
				selectY = tileY;
				printf("Lol select : (%d,%d)\n",tileX,tileY);
			}
			else if (manhattan(selectX,selectY,tileX,tileY) < 3) // if dest tile close enough
			{
				theMap[tileY][tileX] = 'X'; // move the soldier
				theMap[selectY][selectX] = '.';
				selectX = tileX; // modify the selected tile
				selectY = tileY;
				sendMap(theMap); // send info
			}
		}

		else if(!isTouched && receive) // end of touch
		{
			receive = 0;
		}


	}

	return 0;
}

