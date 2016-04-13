/*******************************************************************************
* MyCyclone                                                                    *
********************************************************************************
* Description:                                                                 *
* Functions to control the Cyclone IV                                          *
********************************************************************************
* Version : 1.00 - June 2011                                                   *
*******************************************************************************/

#define  MyCYCLONE

#include "MyApp.h"

void MyCyclone_Init(void)
{
    // Configure Reset Pin = GPIO_2[10] = RD7
    mPORTDClearBits(RST_FPGA);
    mPORTDSetPinsDigitalOut(RST_FPGA);

    // Do a Reset
    mPORTDSetBits(RST_FPGA);
    mPORTDClearBits(RST_FPGA);

    // Do Interrupts Initialization
    // Set RD8/INT1 and RD9/INT2 as inputs
    mPORTDSetPinsDigitalIn(BIT_8 | BIT_9);
    // Clear corresponding bits in INTCON for falling edge trigger
    INTCONCLR = _INTCON_INT1EP_MASK | _INTCON_INT2EP_MASK;
    // Set up interrupt prioirty and sub-priority
    INTSetVectorPriority(INT_EXTERNAL_1_VECTOR, My_INT_EXTERNAL_1_PRIORITY);
    INTSetVectorSubPriority(INT_EXTERNAL_1_VECTOR, My_INT_EXTERNAL_1_SUB_PRIORITY);
    INTSetVectorPriority(INT_EXTERNAL_2_VECTOR, My_INT_EXTERNAL_2_PRIORITY);
    INTSetVectorSubPriority(INT_EXTERNAL_2_VECTOR, My_INT_EXTERNAL_2_SUB_PRIORITY);
    // Clear the interrupt flags
    INTClearFlag(INT_INT1);
    INTClearFlag(INT_INT2);
    // Enable INT1 & INT2
    INTEnable(INT_INT1, INT_ENABLED);
    INTEnable(INT_INT2, INT_ENABLED);
    // Enable KEY0 and KEY1 interrupts and IOs of the MyExpansionBoard_IO_v2
    MyCyclone_Write(CYCLONE_CONFIG,CYCLONE_ENABLE_INT_KEY0 | CYCLONE_ENABLE_INT_KEY1 | CYCLONE_ENABLE_IO_AB | CYCLONE_ENABLE_IO_CD);
}

/*******************************************************************************
*	Interrupt handler functions for INT1 and INT2
*******************************************************************************/
   int cnt= 0 ;
    void delayLol(){
        int i = 0;
        while(i<3000000){
            i = i+2;
            i--;
        }
            
    }

void __ISR(_EXTERNAL_1_VECTOR, My_INT_EXTERNAL_1_IPL) _External1InterruptHandler(void)
{
    // Clear the interrupt flags
    INTClearFlag(INT_INT1);
    MyConsole_SendMsg("Interrupt received from INT1 - KEY0 LOL \n>");
    char str[64];
    int addr = MyCyclone_Read(0x01);
    int data = MyCyclone_Read(addr);
    
    MyCyclone_Write(0x13,0x00);
    //delayLol();
    MyCyclone_Write(0x13,0x00);
    char send[2];
    sprintf(str, "This is readed from spi addr:%d -> %d \n" , addr , data);
    int i;
    switch(addr){
        case 0x02: MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &data , myMIWI_End_fight, 4); // the counter
                   MyCyclone_Write(0x12,myCyclone_End_Fight_lt24); 
                   break;
        case 0x03: MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &data , myMIWI_End_coin_reply,1); // the number of coinces
                    printf("End coin reply"); 
                   break;
                   
        case 0x04: MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &data , myMIWI_End_Snake, 4); //
                   MyCyclone_Write(0x12,myCyclone_End_Snake_lt24); 
                   break;
        case 0x05: if(data == 0){
                        MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &i , myMIWI_Start_fight,1);
                        printf("Start Fight \n");
                    }
                   else if (data==2){
                        if(cnt !=0)
                            MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &i , myMIWI_End_coin,1);
                        delayLol();
                        changePlayer= (cnt!=0);
                        MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &i , myMIWI_Start_coin,1);
                        printf("New Round, changing player 2 data: %d \n" , data);
                   }
                   else if (data == 3){
                       if(cnt != 0)
                            MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &i , myMIWI_End_coin,1);
                       delayLol();
                       changePlayer = (cnt !=0);
                        MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &i , myMIWI_Start_coin,1);
                        printf("New Round, changing player 1 data: %d \n" , data);
                   }
                   else if(data== 5){
                        MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &i , myMIWI_Start_Snake,1);
                   }
                   else if(data==4){
                        MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &i , myMIWI_Start_fight2,1);
                        printf("Start Fight \n");
                   }
                   break;
        case 0x07:  i = 1; //Use to send data to lt24 screen during the Snake game
                    if(data > 128){ /// the direction and the user;
                        data = data- 128;
                        i = 2;
                    }
                    send[0] = i;
                    send[1] = data;
                    MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*)send , myMIWI_Snake_dir,4);
                   
                   break;
        case 0x08: MyMIWI_TxMsg_Mode_Size(myMIWI_EnableBroadcast , (void*) &data , myMIWI_Snake_Winner,1); // Send The winner of the fight
                    break;
                    
        case 0x06: // we send the number of soldiers
                    Player1.soldiers = data%16;
                    Player2.soldiers = data/16;
                    break;
    }

    cnt ++;
    
        
    MyConsole_SendMsg(str);
}


void __ISR(_EXTERNAL_2_VECTOR, My_INT_EXTERNAL_2_IPL) _External2InterruptHandler(void)
{
    // Clear the interrupt flags
    INTClearFlag(INT_INT2);
    MyConsole_SendMsg("Interrupt received from INT2 - KEY1 \n>");
    
}

/******************************************************************************/

void MyCyclone_Write(unsigned int theAddress, unsigned int theData)
{
    unsigned int intStatus;

    intStatus = INTDisableInterrupts();
    mPORTEClearBits(CS_FPGA);
    MySPI_PutC(theAddress | 0x80); // Bit 7 = R/W = 1
    MySPI_PutC(theData);
    mPORTESetBits(CS_FPGA);
    INTRestoreInterrupts(intStatus);
}

/******************************************************************************/

unsigned int MyCyclone_Read(unsigned int theAddress)
{
    unsigned int theData;
    unsigned int intStatus;

    intStatus = INTDisableInterrupts();
    mPORTEClearBits(CS_FPGA);
    MySPI_PutC(theAddress & 0x7F);   // Bit 7 = R/W = 0
    theData = MySPI_GetC();
    mPORTESetBits(CS_FPGA);
    INTRestoreInterrupts(intStatus);
    return(theData);
}

/******************************************************************************/

