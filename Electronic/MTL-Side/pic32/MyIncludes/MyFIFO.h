/*******************************************************************************
* Header file for MyMIWI                                                       *
*******************************************************************************/


#ifndef MyFIFO_H_
#define MyFIFO_H_

/*******************************************************************************
* Constants                                                                    *
*******************************************************************************/


/*******************************************************************************
* Functions Prototypes                                                         *
*******************************************************************************/

int     MyFIFO_Init(void);
int     MyFIFO_Push(void *data, int size);
int     MyFIFO_Pop(void);
void*   MyFIFO_getHead(void);


struct Node{
    struct Node *next;
    struct Node *previous;
    int size;
    void *data;
};

#ifdef   MyFIFO

/*******************************************************************/
// AdditionalNodeID variable array defines the additional
// information to identify a device on a P2P connection. This array
// will be transmitted with the P2P_CONNECTION_REQUEST command to
// initiate the connection between the two devices. Along with the
// long address of this device, this variable array will be stored
// in the P2P Connection Entry structure of the partner device. The
// size of this array is ADDITIONAL_CONNECTION_PAYLOAD, defined in
// P2PDefs.h.
// In this demo, this variable array is set to be empty.
/******************************************************************/
#define ADDITIONAL_NODE_ID_SIZE   1     // WARNING : Also defined in ConfigApp.h

#if ADDITIONAL_NODE_ID_SIZE > 0
    BYTE AdditionalNodeID[ADDITIONAL_NODE_ID_SIZE] = { 0x00 };
#endif

#endif

#endif /* MyMIWI_H_ */
