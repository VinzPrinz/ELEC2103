/*******************************************************************************
* Header file for MyFDDFS                                                      *
*******************************************************************************/

#include "MDD File System/FSIO.h"

#ifndef MyFDDFS_H_
#define MyFDDFS_H_

/*******************************************************************************
* Constants                                                                    *
*******************************************************************************/

struct Image_Info{
    int rows;
    int columns;
    int mult_buf;
};


/*******************************************************************************
* Functions Prototypes                                                         *
*******************************************************************************/


void MyMDDFS_loadSlideshow(char* theCmd);
int  MyMDDFS_ReadImg (char* name);
long MyMDDFS_getImageInfo(FSFILE* inputFile, long offset, int numberOfChars);
void MyMDDFS_Test(void);
void MyMDDFS_Send_Image(void);
int  MyMDDFS_ReadImg_Send(char* name);
void MyMDDFS_InitReceive(struct Image_Info*);
void MyMDDFS_Init(void);

#endif /* MyFDDFS_H_ */
