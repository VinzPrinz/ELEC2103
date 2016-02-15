/*******************************************************************************
* Header file for MyRTCC                                                       *
*******************************************************************************/

#ifndef MyRTCC_H_
#define MyRTCC_H_

/*******************************************************************************
* Functions Prototypes                                                         *
*******************************************************************************/

void MyRTCC_Init(void);
void MyRTCC_SetTime(void);
void MyRTCC_GetTime(void);
void MyRTCC_Task(void);
int MyRTCC_GetTime_Seconds(void);

/*******************************************************************************
* Global Variables for MyRTCC Functions                                        *
*******************************************************************************/

#ifdef   MyRTCC

BOOL    MyRTCC_Flag = FALSE;

#endif


#endif /* MMyRTCC_H_ */
