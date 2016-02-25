
#define  MyCONSOLE

#include "MyApp.h"


struct Node *head;
struct Node *tail;
int size_FIFO;


int MyFIFO_Init(void){
    head = NULL;
    tail = NULL;
    size_FIFO = 0;
}

int MyFIFO_Push(void *data, int size){
    struct Node *newNode;
    newNode = (struct Node *)malloc(sizeof(struct Node));
    
    if(newNode == NULL)
        return -1;
    
    newNode->size = size;
    newNode->data = data;
    
    if(!size_FIFO){
        newNode->next = NULL;
        newNode->previous = NULL;
        head = newNode;
        tail = newNode;
    }else{
        newNode->next = tail;
        tail->previous = newNode;
        tail = newNode;
    }
       
    size_FIFO++;
    return 0;
}

int MyFIFO_Pop(void){
    
    if(!size_FIFO){
        return -1;
    }else if(size_FIFO==1){
        free(head->data);
        free(head);
        head=NULL;
        tail=NULL;
        size_FIFO--;
    }
    else{
        struct Node* oldHead;
        oldHead = head;
        head->previous->next=NULL;
        head = head->previous;
        free(oldHead->data);
        free(oldHead);
        size_FIFO--;
    }  
    return 0;
}

void * MyFIFO_getHead(void){
    if(size_FIFO)
        return head->data;
    else
        return NULL;
}
