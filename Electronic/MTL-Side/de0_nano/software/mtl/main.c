/*
 * main.c
 *
 *  Created on: 15 mars 2016
 *      Author: Prinz
 */

#include <stdio.h>
#include "system.h"
#include "terasic_lib/terasic_includes.h"

// translates touch data to x,y and isTouched signals
void translateTouchData(int touchData, int* x, int* y, int* isTouched)
{
	*isTouched = touchData & 0x0001;
	*y = (touchData>>1) & 0x01FF; // take 9 bits
	*x = (touchData>>10) & 0x03FF; // take 10 bits
}

int main()
{
	int test,x,y,isTouched;
	printf("Hello from MTL side!\n");

	IOWR(TESTLED_BASE, 0x0, 0x3);

	while(1)
	{
		test = IORD(TOUCHDATA_BASE, 0x0);
		translateTouchData(test, &x, &y, &isTouched);
		if(isTouched)
			printf("Lol : (%d,%d)\n",x,y);
	}

	return 0;
}

