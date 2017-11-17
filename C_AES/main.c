#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int loopItrs = 10;
int msgBytes = 16;
int keyBytes = 16;

void expandKey() {}

void addRoundKey(char* state,char* roundKey) {
    int i;
    for (i=0; i<16; i++) {
        state[i] = state[i] ^ roundKey[i];
    }
}

void subBytes() {}

void shiftRows() {}

void mixColumns() {}

void aesEncrypt(char * key, char * message, size_t lenMessage, char * result) {
    int i, j, k;
    char state[17];
    char tempResult[lenMessage];
    // This may need to move to calculate parts of keys as required
    expandKey();
    // Iterate over given message in blocks of 16 bytes
    for (j=0;j<lenMessage;j=j+16) {
        // Get the state as 16 bytes of message
        memcpy(state, &message[j], 16);
        // Null terminate string
        state[16] = '\0';
        printf("State: %s\n", state);

        addRoundKey(state, key);

        for(i=0;i<loopItrs;i++) {
            subBytes();
            shiftRows();
            mixColumns();
            addRoundKey(state, key);
        }

        subBytes();
        shiftRows();
        addRoundKey(state, key);

        // Collect the results in tempResult
        printf("State Result: %s\n", state);
        k=0;
        for (i=j;i<j+16;i++) {
            tempResult[i] = state[k++];
        }
    }

    printf("Final result: %s\n", tempResult);
    // Return a pointer to the results
    strcpy(result,tempResult);

}

size_t genPadMessage(char* message, char* padMessage, size_t lenMessage) {
    int i;
    int lenPad = 0;
    int lenMesRem  = lenMessage % 16;
    strcpy(padMessage,message);
    printf("Test: %s\n", message);
    if (lenMesRem > 0) {
        lenPad = 16 - lenMessage % 16;
        for (i=lenMessage;i<lenMessage+lenPad;i++) {
            padMessage[i] = 0;
        }
        padMessage[i] = '\0';
    }
    return lenMessage+lenPad;
}

int main()
{
    printf("Running C_AES!\n");
    char key[]          = "0123456789ABCDEF"; // 16 ASCII (1 byte each) = 128 bits
    char message[]      = "This is a test!!!!"; // A message of any length
    char *padMessage    = malloc(256);
    size_t lenPadMessage;
    size_t lenMessage;
    char result[msgBytes];
    lenMessage = sizeof(message) - 1 ;
    lenPadMessage = genPadMessage(message, padMessage, lenMessage);
    printf("PadMessage: %s\n", padMessage);
    aesEncrypt(key, padMessage, lenPadMessage, result);

    printf("Result: %s", result);

    return 0;
}
