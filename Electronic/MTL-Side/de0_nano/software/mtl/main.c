/*
 * Group 7
 * first test for mtl nios
 *
 */

#include "terasic_lib/terasic_includes.h"

int main()
{
 printf("Welcome to MTL side Nios II !\n");

 // Test to write the leds
 IOWR(TESTLED_BASE, 0x0, 0x03);

 // Sleep 3s
 //usleep(3*1000*1000);

 return 0;
}
