/*
 *  Created on: Feb 25, 2016
 *      Author: obronchain
 */

#include <stdio.h>
#include "system.h"
#include "io.h"

int main(){
	volatile int * spi = (int *) CYCLONESPI_BASE;
	int v = 0;
	printf("Hello world \n");
	while(1){
		printf("spi gives %d\n" , IORD_8DIRECT(CYCLONESPI_BASE,0));
		usleep(100*1000);
		IOWR_8DIRECT(CYCLONESPI_BASE,0,v);
		v++;
	}
	return 0;
}
