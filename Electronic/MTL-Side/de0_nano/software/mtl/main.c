/*
 * main.c
 *
 *  Created on: 15 mars 2016
 *      Author: Prinz
 */
//

// TODO : solve glitch between turns => DONE! TODO : check if no chance of random glitch appearing for same reason because no init

#include <stdio.h>
#include <stdlib.h>
#include "system.h"
#include "terasic_lib/terasic_includes.h"

// mode definitions
#define MODE_FIGHT 0x0
#define MODE_MAP_PLAYER0 0x2
#define MODE_MAP_PLAYER1 0x3

// global variables containing info about the state of the game
char MTL_state = 0;
int map = 1; // = 1 if in the map, = 0 if fight
int playersTurn = 0; // = 0 if red playing, = 1 if blue playing
int tileX, tileY,selectX, selectY; // touched tile and selected tile (can only be a soldier)

// create the map : '.' = empty, 'X' = red soldier, 'Y' = blue soldier
char theMap[8][16] = {{'.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'},
					  {'.','.','X','.','.','.','.','.','.','.','.','.','.','Y','.','.'},
					  {'.','X','.','.','.','.','.','.','.','.','.','.','.','.','Y','.'},
					  {'.','.','.','X','.','.','.','.','.','.','.','.','Y','.','.','.'},
					  {'.','.','.','X','.','.','.','.','.','.','.','.','Y','.','.','.'},
					  {'.','X','.','.','.','.','.','.','.','.','.','.','.','.','Y','.'},
					  {'.','.','X','.','.','.','.','.','.','.','.','.','.','Y','.','.'},
					  {'.','.','.','.','.','.','.','.','.','.','.','.','.','.','.','.'}};


// translates touch data to x,y and isTouched signals
void translateTouchData(int touchData, int* x, int* y, int* isTouched)
{
	*isTouched = touchData & 0x0001;
	*y = (touchData>>1) & 0x01FF; // take 9 bits
	*x = (touchData>>10) & 0x03FF; // take 10 bits
}

// sends the map to the mtl controller to be displayed
void sendMap()
{
	int i,j;
	int data;
	for(i=0; i<8; i++) // send to 8 addresses, one per line
	{
		data = 0; // for now 00 = grass, 10 (2) = red peyo, 11 (3) = blue peyo
		for(j=0; j<16; j++)
		{
			if (theMap[i][j] == 'X')
				data += 0x2<<(2*j);
			else if (theMap[i][j] == 'Y')
				data += 0x3<<(2*j);
		}
		// send line i
		IOWR(MAPTRANSFER_BASE, i, data);
	}
}

// translate pixel coordinates (x,y) to tile coordinates
void translateToTiles(int x, int y, int* xTile, int* yTile)
{
	*xTile = x/50;
	*yTile = y/50; // TODO !!!! handle case where out of the map (menu) ?!
}

// return manhattan distance between 2 tiles
int manhattan(int x1, int y1, int x2, int y2)
{
	return abs(x1-x2) + abs(y1-y2);
}

// send mode to MTL AND to SPI interfaces
void sendMode(int mode)
{
	IOWR(MTL_INTERFACE_IRQ_0_BASE+4,0,mode);
	IOWR(CYCLONESPI_0_BASE+(4*0x05),0,mode);
}

// interrupt after a fight
void MTL_ISR(void *context){
	printf("this is the counter %d \n" , IORD(MTL_INTERFACE_IRQ_0_BASE+8 ,0 )); // read counter
	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x1);

	int winner = 1; // TODO !!!!!!!!!!!!!!!! change this, here blue wins always :)
	theMap[tileY][tileX] = winner ? 'Y' : 'X'; // update the map for the winner
	sendMap();

	int i=  0;
	for(i;i<100000;i++)
	{}
	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x0);
	sendMode(playersTurn ? MODE_MAP_PLAYER1 : MODE_MAP_PLAYER0); // end the fight
	map = 1;
}

void MTL_reset()
{
	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x1);
	int i=  0;
	for(i;i<100000;i++)
	{}
	IOWR(MTL_INTERFACE_IRQ_0_BASE , 0 , 0x0);
}

int main()
{
	int x,y,isTouched; // (x,y) coordinates of the touch, and isTouched = 1 if screen is being touched
	int receive = 0; // indicates when we receive NEW data from the touch (= 1 if data is new)

	// start everything
	printf("Let the game begin!!\n");
	sendMap(); // send the starting map in the beginning
	MTL_reset();

	// ------------------ Trucs d'oli, pas toucher ---------------------------------
	int reg_ret = alt_iic_isr_register(MTL_INTERFACE_IRQ_0_IRQ_INTERRUPT_CONTROLLER_ID,
											MTL_INTERFACE_IRQ_0_IRQ,
										&MTL_ISR , (void *)&MTL_state , NULL);
	if(!reg_ret) {
		printf("Button interrupt service routine (ISR) well registered \n");
	} else {
		printf("Something went wrong in the registering; software exits");
		return -1;
	}
	// --------------------------------------------------------------------------------

	// player 0 begins to play
	sendMode(MODE_MAP_PLAYER0);

	while(1) // begin game forever TODO : end game if no soldiers of one color (later)
	{
		if (map) // if we are in map mode (and not in fight mode)
		{
			translateTouchData(IORD(TOUCHDATA_BASE, 0x0), &x, &y, &isTouched); // try to get touch data
			if(isTouched && !receive) // if it is a new touch we sensed only, see where we touched and do things
			{
				translateToTiles(x, y, &tileX, &tileY); // get tile value in x and y
				receive = 1;

				if (tileY >= 8) // if true : outside the map, we are in menu bar
				{
					playersTurn = !playersTurn; // change the players turn
					printf("Player change\n");
					sendMode(playersTurn ? MODE_MAP_PLAYER1 : MODE_MAP_PLAYER0); // send the new mode
					// TRICK to avoid the glitch between turns :)
					selectX = -3; // deselect
					selectY = -3;
				}
				else if (!playersTurn) // if red player
				{
					if (theMap[tileY][tileX] == 'X') // if we touched a red soldier : select it
					{
						selectX = tileX; // new selected tile
						selectY = tileY;
						printf("Lol select : (%d,%d)\n",tileX,tileY);
					}
					else if (manhattan(selectX,selectY,tileX,tileY) < 3) // if destination tile close enough
					{
						if (theMap[tileY][tileX] == 'Y') // if it is an enemy
						{ // start fight
							map = 0;
							theMap[selectY][selectX] = '.'; // empty attacker side
							sendMode(MODE_FIGHT);
						}
						else //if it is grass
						{
							theMap[tileY][tileX] = 'X'; // move the soldier
							theMap[selectY][selectX] = '.';
							selectX = tileX; // modify the selected tile
							selectY = tileY;
							sendMap(); // send info
						}
					}
				}
				else // blue players turn (code almost the same) TODO : have code only once (not hard to do but lazy right now :) => later)
				{
					if (theMap[tileY][tileX] == 'Y') // if we touched a blue soldier
					{
						selectX = tileX;
						selectY = tileY;
						printf("Lol select : (%d,%d)\n",tileX,tileY);
					}
					else if (manhattan(selectX,selectY,tileX,tileY) < 3) // if dest tile close enough
					{
						if (theMap[tileY][tileX] == 'X')
						{ // start fight
							map = 0;
							theMap[selectY][selectX] = '.'; // empty attacker side
							sendMode(MODE_FIGHT);
						}
						else
						{
							theMap[tileY][tileX] = 'Y'; // move the soldier
							theMap[selectY][selectX] = '.';
							selectX = tileX; // modify the selected tile
							selectY = tileY;
							sendMap(); // send info
						}
					}
				}
			}
			else if(!isTouched && receive) // end of touch
			{
				receive = 0; // be ready for next touch
			}

		}
		else // else map => we are in a fight : do nothing ?
		{

		}
	} // end while 1
	return 0;
}

