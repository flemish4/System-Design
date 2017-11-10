#include <stdio.h>
#include <stdlib.h>

int loopItrs = 10;
int msgBytes = 16;
int keyBytes = 16;

void expandKey() {}

void addRoundKey() {}

void subBytes() {}

void shiftRows() {}

void mixColumns() {}



void aesEncrypt(char key[keyBytes], char message[msgBytes], char result[msgBytes]) {
    int i;
    expandKey();
    addRoundKey();

    for(i=0;i<loopItrs;i++) {
        subBytes();
        shiftRows();
        mixColumns();
        addRoundKey();
    }

    subBytes();
    shiftRows();
    addRoundKey();

}




int main()
{
    printf("Running C_AES!\n");
    char key[]          = "This is a key!!!"; // 16 ASCII (1 byte each) = 128 bits
    char message[]      = "This is a test!!"; // A message of any lenth
    char result[msgBytes];

    aesEncrypt(key, message, result);

    printf("Result: %s", result);

    return 0;
}
