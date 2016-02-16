
#define  MyCONSOLE

#include "MyApp.h"


struct Node *head;
struct Node *tail;
int size_FIFO;

/*int main(){
    printf("Hello world \n");
    char *str1="This is char 1";
    char *str2="This is char 2";
    char *str3="This is char 3";

    MyFIFO_Init();
    MyFIFO_Push((void *)str1,10);
    MyFIFO_Push((void *)str2,10);


    printf("This is the first message %s\n", (char *) MyFIFO_getHead());
    if(MyFIFO_Pop())
        return -1;
    printf("This is the seconde message: %s \n",(char *)MyFIFO_getHead());

    if(MyFIFO_Pop())
        return -1;

    if(!MyFIFO_getHead())
        printf("return NULL as expected \n");

    if(MyFIFO_Pop())
        printf("return -1 ass expected \n");
}
*/

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
