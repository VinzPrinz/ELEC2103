/*******************************************************************************
* MyMIWI                                                                       *
********************************************************************************
* Description:                                                                 *
* Functions to control the Module 802.15.4 - MRF24J40MB                        *
********************************************************************************
* Version : 1.00 - July 2011                                                   *
*******************************************************************************/

/* Modifications to the Microchip MIWI Library : MRF24J40.c
 *
 *  Line 1593 - Routine HighISR
 *      Commment : void __ISR(_EXTERNAL_1_VECTOR, ipl4) _INT1Interrupt(void)
 *      Add      : void __ISR(_EXTERNAL_3_VECTOR, ipl4) _INT3Interrupt(void)
 *
 *  Disable all interrupts during SPI access
 *      PHYSetLongRAMAddr, PHYSetShortRAMAddr, PHYGetShortRAMAddr, PHYGetLongRAMAddr
 */
#define  MyMIWI_NODE1       // #define EUI_0 0x01 in ConfigApp.h
//#define  MyMIWI_NODE2       // #define EUI_0 0x03 in ConfigApp.h

#if defined(MyMIWI_NODE1) && defined(MyMIWI_NODE2)
    #error "Only 1 node must be defined"
#endif
#if !defined(MyMIWI_NODE1) && !defined(MyMIWI_NODE2)
    #error "1 node must be defined"
#endif

#define  MyMIWI


#include "MyApp.h"
#include <time.h>


unsigned char tag;
unsigned char received_tag;
unsigned char data_sended;
unsigned int  last_sended;




int MyMIWI_Encapsulate_Frame(BOOL enableBroadcast , void *data , int size){
    struct Frame *pFrame;
    pFrame = (struct Frame*) malloc(sizeof(struct Frame));
    
    if(!pFrame)
        return -1; 
    
    pFrame-> enableBroadcast = enableBroadcast;
    pFrame-> data = data;
    pFrame-> size = size;
    
    MyFIFO_Push(pFrame , sizeof(struct Frame));
    MyMIWI_Check_FIFO();
    return 0;
}

int MyMIWI_Check_FIFO(void){
    long now;
    struct Frame *pFrame;
    void *head;
    

    head = MyFIFO_getHead();
    
    if(!head)
        return -1;
    else{
        unsigned int tWait ,now;
        tWait=(SYS_FREQ/2000)*myMIWI_Retransmit_Delay;
        pFrame = (struct Frame *) head;
        now = ReadCoreTimer();
        char str[64];
        sprintf(str, "The delay is %d , %d \n" , now-last_sended , tWait);
        MyConsole_SendMsg(str);
        if(now - last_sended>=tWait || !data_sended){
            MyConsole_SendMsg("Data will be transmited \n");
            MyMIWI_SendFrame(pFrame);
            last_sended = now;
            data_sended=1;
        }
    }
    return 0;
}

int MyMIWI_SendFrame(struct Frame *pFrame){
    
    int size = pFrame->size;
    void *data  = pFrame -> data;
    BOOL enableBroadcast = pFrame->enableBroadcast;
    
    /*******************************************************************/
    // First call MiApp_FlushTx to reset the Transmit buffer. Then fill
    // the buffer one byte by one byte by calling function
    // MiApp_WriteData
    /*******************************************************************/

    char *pChar;
    MiApp_FlushTx();
    
    int i = 0;
    pChar = (char *)data;
    
    while (i<size){
        MiApp_WriteData(*pChar++);
        i++;
    }
   
    if (enableBroadcast) {

        /*******************************************************************/
        // Function MiApp_BroadcastPacket is used to broadcast a message
        //    The only parameter is the boolean to indicate if we need to
        //       secure the frame
        /*******************************************************************/
        MiApp_BroadcastPacket(FALSE);

    } else {

        /*******************************************************************/
        // Function MiApp_UnicastConnection is one of the functions to
        //  unicast a message.
        //    The first parameter is the index of Connection Entry for
        //       the peer device. In this demo, since there are only two
        //       devices involved, the peer device must be stored in the
        //       first Connection Entry
        //    The second parameter is the boolean to indicate if we need to
        //       secure the frame. If encryption is applied, the security
        //       key are defined in ConfigApp.h
        //
        // Another way to unicast a message is by calling function
        //  MiApp_UnicastAddress. Instead of supplying the index of the
        //  Connection Entry of the peer device, this function requires the
        //  input parameter of destination address.
        /*******************************************************************/
        if( MiApp_UnicastConnection(0, FALSE) == FALSE )
            Printf("\r\nUnicast Failed\r\n");
    }
    
    return 0;
}
void MyMIWI_Init(void) {

    
    last_sended  = MyRTCC_GetTime_Seconds();
    tag = 1;
    received_tag = 0;
    
    MyFIFO_Init();
    srand(time(NULL)); // initialisation de rand

    data_sended=0;
    // Configure Pins for MRF24J40MB
    mPORTESetBits(RST_MIWI);
    mPORTESetPinsDigitalOut(RST_MIWI);

    mPORTBSetBits(MIWI_WAKE);
    mPORTBSetPinsDigitalOut(MIWI_WAKE);

    // Configure the INT3 controller for MIWI
    // Set RD10/INT3 as input
    mPORTDSetPinsDigitalIn(BIT_10);
    // Clear corresponding bits in INTCON for falling edge trigger
    INTCONCLR = _INTCON_INT3EP_MASK;
    // Set up interrupt prioirty and sub-priority
    INTSetVectorPriority(INT_EXTERNAL_3_VECTOR, My_INT_EXTERNAL_3_PRIORITY);
    INTSetVectorSubPriority(INT_EXTERNAL_3_VECTOR, My_INT_EXTERNAL_3_SUB_PRIORITY);
    // Clear the interrupt flags
    INTClearFlag(INT_INT3);
    // Enable INT3
    INTEnable(INT_INT3, INT_ENABLED);

    // WARNING : Change in file MRF24J40.c in Microchip Application Library
    // the line : void __ISR(_EXTERNAL_1_VECTOR, ipl4) _INT1Interrupt(void)
    // by       : void __ISR(_EXTERNAL_3_VECTOR, ipl4) _INT3Interrupt(void)
}

void MyMIWI_Start(void) {
    
    BYTE    i;
    char    theStr[64];

    /*******************************************************************/
    // Initialize Microchip proprietary protocol. Which protocol to use
    // depends on the configuration in ConfigApp.h
    /*******************************************************************/
    /*******************************************************************/
    // Function MiApp_ProtocolInit initialize the protocol stack. The
    // only input parameter indicates if previous network configuration
    // should be restored. In this simple example, we assume that the
    // network starts from scratch.
    /*******************************************************************/
    MiApp_ProtocolInit(FALSE);

    // Set default channel
    if( MiApp_SetChannel(myMIWI_Channel) == FALSE )
    {
        Printf("\r\nSelection of channel ");
        PrintDec(myMIWI_Channel);
        Printf(" is not supported in current condition.\r\n");
        return;
    }

    /*******************************************************************/
    // Function MiApp_ConnectionMode defines the connection mode. The
    // possible connection modes are:
    //  ENABLE_ALL_CONN:    Enable all kinds of connection
    //  ENABLE_PREV_CONN:   Only allow connection already exists in
    //                      connection table
    //  ENABL_ACTIVE_SCAN_RSP:  Allow response to Active scan
    //  DISABLE_ALL_CONN:   Disable all connections.
    /*******************************************************************/
    MiApp_ConnectionMode(ENABLE_ALL_CONN);

    /*******************************************************************/
    // Function MiApp_EstablishConnection try to establish a new
    // connection with peer device.
    // The first parameter is the index to the active scan result, which
    //      is acquired by discovery process (active scan). If the value
    //      of the index is 0xFF, try to establish a connection with any
    //      peer.
    // The second parameter is the mode to establish connection, either
    //      direct or indirect. Direct mode means connection within the
    //      radio range; Indirect mode means connection may or may not
    //      in the radio range.
    /*******************************************************************/

#if defined(MyMIWI_NODE1)
    i = MiApp_EstablishConnection(0xFF, CONN_MODE_DIRECT);
#else
    while( (i = MiApp_EstablishConnection(0xFF, CONN_MODE_DIRECT)) == 0xFF );
#endif

    if(i != 0xFF) {
        sprintf(theStr, "Connected Peer  on Channel %d\n>", myMIWI_Channel);
        MyConsole_SendMsg(theStr);
    }
    else {
        
    /*******************************************************************/
    // If no network can be found and join, we need to start a new 
    // network by calling function MiApp_StartConnection
    //
    // The first parameter is the mode of start connection. There are 
    // two valid connection modes:
    //   - START_CONN_DIRECT        start the connection on current 
    //                              channel
    //   - START_CONN_ENERGY_SCN    perform an energy scan first, 
    //                              before starting the connection on 
    //                              the channel with least noise
    //   - START_CONN_CS_SCN        perform a carrier sense scan 
    //                              first, before starting the 
    //                              connection on the channel with 
    //                              least carrier sense noise. Not
    //                              supported for current radios
    //
    // The second parameter is the scan duration, which has the same 
    //     definition in Energy Scan. 10 is roughly 1 second. 9 is a 
    //     half second and 11 is 2 seconds. Maximum scan duration is 
    //     14, or roughly 16 seconds.
    //
    // The third parameter is the channel map. Bit 0 of the 
    //     double word parameter represents channel 0. For the 2.4GHz 
    //     frequency band, all possible channels are channel 11 to 
    //     channel 26. As the result, the bit map is 0x07FFF800. Stack 
    //     will filter out all invalid channels, so the application 
    //     only needs to pay attention to the channels that are not 
    //     preferred.
    /*******************************************************************/
        MiApp_StartConnection(START_CONN_DIRECT, 10, 0);
        MyConsole_SendMsg("Start Connection\n>");
    }

    /*******************************************************************/
    // Function DumpConnection is used to print out the content of the
    //  Connection Entry on the hyperterminal. It may be useful in
    // the debugging phase.
    // The only parameter of this function is the index of the
    // Connection Entry. The value of 0xFF means to print out all
    //  valid Connection Entry; otherwise, the Connection Entry
    // of the input index will be printed out.
    /*******************************************************************/
    DumpConnection(0xFF);
}

/******************************************************************************/

BOOL MyMIWI_RxMsg(char *theMsg) {

    int i;

    /*******************************************************************/
    // Function MiApp_MessageAvailable returns a boolean to indicate if
    //  a packet has been received by the transceiver. If a packet has
    //  been received, all information will be stored in the rxFrame,
    //  structure of RECEIVED_MESSAGE.
    /*******************************************************************/
    if( !MiApp_MessageAvailable() )
        return FALSE;

    /*******************************************************************/
    // If a packet has been received, following code prints out some of
    // the information available in rxMessage.
    /*******************************************************************/
    if( rxMessage.flags.bits.secEn )
        ConsolePutROMString((ROM char *)"Secured ");

    if( rxMessage.flags.bits.broadcast )
        ConsolePutROMString((ROM char *)"Broadcast Packet with RSSI ");
    else
        ConsolePutROMString((ROM char *)"Unicast Packet with RSSI ");

    PrintChar(rxMessage.PacketRSSI);

    if( rxMessage.flags.bits.srcPrsnt ) {
        ConsolePutROMString((ROM char *)" from ");
         if( rxMessage.flags.bits.altSrcAddr ) {
            PrintChar(rxMessage.SourceAddress[1]);
            PrintChar(rxMessage.SourceAddress[0]);
         } else {
            for(i = 0; i < MY_ADDRESS_LENGTH; i++)
                PrintChar(rxMessage.SourceAddress[MY_ADDRESS_LENGTH-1-i]);
         }
    }

    ConsolePutROMString((ROM char *)" : ");
    for(i = 0; i < rxMessage.PayloadSize; i++) {
        ConsolePut(rxMessage.Payload[i]);
        *theMsg++ = rxMessage.Payload[i];
    }
    ConsolePutROMString((ROM char *)"\n");
    *theMsg = '\0';

    /*******************************************************************/
    // Function MiApp_DiscardMessage is used to release the current
    //  received packet.
    // After calling this function, the stack can start to process the
    //  next received frame
    /*******************************************************************/
    MiApp_DiscardMessage();

    return TRUE;
}

/******************************************************************************/

void MyMIWI_Ack(BOOL enableBroadcast, char tag)
{
    /*******************************************************************/
    // First call MiApp_FlushTx to reset the Transmit buffer. Then fill
    // the buffer one byte by one byte by calling function
    // MiApp_WriteData
    /*******************************************************************/
    
    MyConsole_SendMsg("This is in MyMIWI_Ack \n");
    MiApp_FlushTx();
    
    MiApp_WriteData(myMIWI_Ack);
    MiApp_WriteData(tag);
    MiApp_WriteData(0);
    MiApp_WriteData(0);

    if (enableBroadcast) {

        /*******************************************************************/
        // Function MiApp_BroadcastPacket is used to broadcast a message
        //    The only parameter is the boolean to indicate if we need to
        //       secure the frame
        /*******************************************************************/
        MiApp_BroadcastPacket(FALSE);

    } else {

        /*******************************************************************/
        // Function MiApp_UnicastConnection is one of the functions to
        //  unicast a message.
        //    The first parameter is the index of Connection Entry for
        //       the peer device. In this demo, since there are only two
        //       devices involved, the peer device must be stored in the
        //       first Connection Entry
        //    The second parameter is the boolean to indicate if we need to
        //       secure the frame. If encryption is applied, the security
        //       key are defined in ConfigApp.h
        //
        // Another way to unicast a message is by calling function
        //  MiApp_UnicastAddress. Instead of supplying the index of the
        //  Connection Entry of the peer device, this function requires the
        //  input parameter of destination address.
        /*******************************************************************/
        if( MiApp_UnicastConnection(0, FALSE) == FALSE )
            Printf("\r\nUnicast Failed\r\n");
    }
}


void MyMIWI_TxMsg(BOOL enableBroadcast, char *theMsg)
{
    /*******************************************************************/
    // First call MiApp_FlushTx to reset the Transmit buffer. Then fill
    // the buffer one byte by one byte by calling function
    // MiApp_WriteData
    /*******************************************************************/
    MiApp_FlushTx();
    while (*theMsg != '\0')
        MiApp_WriteData(*theMsg++);

    if (enableBroadcast) {

        /*******************************************************************/
        // Function MiApp_BroadcastPacket is used to broadcast a message
        //    The only parameter is the boolean to indicate if we need to
        //       secure the frame
        /*******************************************************************/
        MiApp_BroadcastPacket(FALSE);

    } else {

        /*******************************************************************/
        // Function MiApp_UnicastConnection is one of the functions to
        //  unicast a message.
        //    The first parameter is the index of Connection Entry for
        //       the peer device. In this demo, since there are only two
        //       devices involved, the peer device must be stored in the
        //       first Connection Entry
        //    The second parameter is the boolean to indicate if we need to
        //       secure the frame. If encryption is applied, the security
        //       key are defined in ConfigApp.h
        //
        // Another way to unicast a message is by calling function
        //  MiApp_UnicastAddress. Instead of supplying the index of the
        //  Connection Entry of the peer device, this function requires the
        //  input parameter of destination address.
        /*******************************************************************/
        if( MiApp_UnicastConnection(0, FALSE) == FALSE )
            Printf("\r\nUnicast Failed\r\n");
    }
}


/* Send message via zigbee with unicast or broadcast.
 * Send a character chain with the given myMIWI mode. 
 */
void MyMIWI_TxMsg_Mode(BOOL enableBroadcast, char *theMsg, char MODE)
{
    /*******************************************************************/
    // First call MiApp_FlushTx to reset the Transmit buffer. Then fill
    // the buffer one byte by one byte by calling function
    // MiApp_WriteData
    /*******************************************************************/
    
    char *data;
    int i;
    int size;
    
    
    size = strlen(theMsg)+2+2;
    data = (char *)malloc(strlen(theMsg)+4+1);
    
    data[0] = MODE;
    data[1] = tag;
    data[2] = 0;
    data[3] = 0;
    
    tag ++;
    
    i=4;
    
    while (i<(size-1)){
        data[i]=*theMsg++;
        i++;
    }
    
    MyMIWI_Encapsulate_Frame(enableBroadcast , (void*)data , size);

}

/* Send message via zigbee with unicast or broadcast.
 * Send a *void of given size with the given myMIWI mode. 
 */
void MyMIWI_TxMsg_Mode_Size(BOOL enableBroadcast, void *theMsg, char MODE , int size)
{
    /*******************************************************************/
    // First call MiApp_FlushTx to reset the Transmit buffer. Then fill
    // the buffer one byte by one byte by calling function
    // MiApp_WriteData
    /*******************************************************************/

    char *data;
    char *pChar;
    int i;
    
    data = (char *)malloc(size + 4);
    
    // Write the first 32 bits word (get words align @ receiver)
    data[0] = MODE;
    data[1] = tag;
    data[2] = 0;
    data[3] = 0;
    
    tag++;
    pChar = (char *)theMsg;
    
    i=4;
    while (i<size){
        data[i]= *pChar++;
        i++;
    }
    
    MyMIWI_Encapsulate_Frame(enableBroadcast , (void*)data , size);

 
}


/******************************************************************************/

// Implementation of MSPI.c

void SPIPut(BYTE v) { MySPI_PutC((unsigned int) v); }
BYTE SPIGet(void)   { return ((BYTE) MySPI_GetC()); }

/******************************************************************************/

/*
 * function: MyMIWI_Task()
 * post: Handel the received data on MIWI. The first byte of data is a tag used
 *      to describe why the packet was send. There is a few possibility:
 *          -myMIWI_Chat: Used for chat. Simply display it 
 *          -myMIWI_Web: Change the value of MyWebMessage (this value is displayed
 *                       on the web site.
 *          -myMIWI_Image_Info: Will display an image on the MTL screen given the 
 *                       informations. To do so we recover the structur Image_Info 
 */
void MyMIWI_Task(void) {

    char theData[64], theStr[128];
    if (MyMIWI_RxMsg(theData)) {
        char MODE;
        MODE = theData[0];
        struct Image_Info *pimage_info;
        struct Image *pimage;
        sprintf(theStr , "Tag %x \n", theData[1]);
        MyConsole_SendMsg(theStr);
        switch(MODE){
            case myMIWI_Chat:
                if(received_tag+1 == theData[1]){
                    sprintf(theStr, "Message from Chat '%s'\n" , &theData[4]);
                    MyConsole_SendMsg(theStr);
                    received_tag++;
                }
                MyMIWI_Ack(myMIWI_EnableBroadcast , theData[1]);
                break;
            case myMIWI_Web:
                if(received_tag+1 == theData[1]){
                    sprintf(theStr, "Message for website '%s'\n", &theData[4]);
                    MyConsole_SendMsg(theStr);
                    strcpy(MyWebMessage ,&theData[4]);
                    received_tag++;
                }
                MyMIWI_Ack(myMIWI_EnableBroadcast , theData[1]);
                break;
            case myMIWI_Image_Info:
                if(received_tag +1 == theData[1]){
                    pimage_info = (struct Image_Info *) &theData[4];
                    sprintf(theStr, "New Image_Info received\nrows: %d\ncolumns %d\nn:%d\n",pimage_info->rows , pimage_info->columns, pimage_info->n);
                    MyConsole_SendMsg(theStr);
                    MyMDDFS_InitReceive(pimage_info);
                }
                MyMIWI_Ack(myMIWI_EnableBroadcast , theData[1]);
                break;
            case myMIWI_Image:
                if(received_tag +1 == theData[1]){
                    pimage = (struct Image *) &theData[4];
                    MyMDDFS_ReceiveImage(pimage);
                }
                MyMIWI_Ack(myMIWI_EnableBroadcast , theData[1]);
                break;
            case myMIWI_Ack:
                sprintf(theStr , "Ack received for tag: %x" , theData[1]);
                MyConsole_SendMsg(theStr);
                MyFIFO_Pop();
                data_sended=0;
                break;
            default:
                sprintf(theStr, "Unknown MODE: %x %x %x %x" , theData[0], theData[1], theData[2], theData[3]);
                break;
        }
    }
    MyMIWI_Check_FIFO();
}

/******************************************************************************/
