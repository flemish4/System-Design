#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int loopItrs = 10;
int msgBytes = 16;
int keyBytes = 16;

unsigned char sBox[256] =
{
0x63, 0x7C, 0x77, 0x7B, 0xF2, 0x6B, 0x6F, 0xC5, 0x30, 0x01, 0x67, 0x2B, 0xFE, 0xD7, 0xAB, 0x76,
0xCA, 0x82, 0xC9, 0x7D, 0xFA, 0x59, 0x47, 0xF0, 0xAD, 0xD4, 0xA2, 0xAF, 0x9C, 0xA4, 0x72, 0xC0,
0xB7, 0xFD, 0x93, 0x26, 0x36, 0x3F, 0xF7, 0xCC, 0x34, 0xA5, 0xE5, 0xF1, 0x71, 0xD8, 0x31, 0x15,
0x04, 0xC7, 0x23, 0xC3, 0x18, 0x96, 0x05, 0x9A, 0x07, 0x12, 0x80, 0xE2, 0xEB, 0x27, 0xB2, 0x75,
0x09, 0x83, 0x2C, 0x1A, 0x1B, 0x6E, 0x5A, 0xA0, 0x52, 0x3B, 0xD6, 0xB3, 0x29, 0xE3, 0x2F, 0x84,
0x53, 0xD1, 0x00, 0xED, 0x20, 0xFC, 0xB1, 0x5B, 0x6A, 0xCB, 0xBE, 0x39, 0x4A, 0x4C, 0x58, 0xCF,
0xD0, 0xEF, 0xAA, 0xFB, 0x43, 0x4D, 0x33, 0x85, 0x45, 0xF9, 0x02, 0x7F, 0x50, 0x3C, 0x9F, 0xA8,
0x51, 0xA3, 0x40, 0x8F, 0x92, 0x9D, 0x38, 0xF5, 0xBC, 0xB6, 0xDA, 0x21, 0x10, 0xFF, 0xF3, 0xD2,
0xCD, 0x0C, 0x13, 0xEC, 0x5F, 0x97, 0x44, 0x17, 0xC4, 0xA7, 0x7E, 0x3D, 0x64, 0x5D, 0x19, 0x73,
0x60, 0x81, 0x4F, 0xDC, 0x22, 0x2A, 0x90, 0x88, 0x46, 0xEE, 0xB8, 0x14, 0xDE, 0x5E, 0x0B, 0xDB,
0xE0, 0x32, 0x3A, 0x0A, 0x49, 0x06, 0x24, 0x5C, 0xC2, 0xD3, 0xAC, 0x62, 0x91, 0x95, 0xE4, 0x79,
0xE7, 0xC8, 0x37, 0x6D, 0x8D, 0xD5, 0x4E, 0xA9, 0x6C, 0x56, 0xF4, 0xEA, 0x65, 0x7A, 0xAE, 0x08,
0xBA, 0x78, 0x25, 0x2E, 0x1C, 0xA6, 0xB4, 0xC6, 0xE8, 0xDD, 0x74, 0x1F, 0x4B, 0xBD, 0x8B, 0x8A,
0x70, 0x3E, 0xB5, 0x66, 0x48, 0x03, 0xF6, 0x0E, 0x61, 0x35, 0x57, 0xB9, 0x86, 0xC1, 0x1D, 0x9E,
0xE1, 0xF8, 0x98, 0x11, 0x69, 0xD9, 0x8E, 0x94, 0x9B, 0x1E, 0x87, 0xE9, 0xCE, 0x55, 0x28, 0xDF,
0x8C, 0xA1, 0x89, 0x0D, 0xBF, 0xE6, 0x42, 0x68, 0x41, 0x99, 0x2D, 0x0F, 0xB0, 0x54, 0xBB, 0x16
};



void expandKeyCore(unsigned char* subKey, unsigned char i) {
    // Rotate left



}

void getRoundKey(unsigned char* roundKey) {
    int i,j;
    unsigned char tempStore[17];
    unsigned char tempWord[5];
    unsigned char curRCon = 0x01;
    // Init unsigned char arrays
    tempStore[16] = '\0';
    tempWord[5]   = '\0';

    // Rotate Left W(i-1)
    tempWord[0] = roundKey[13];
    tempWord[1] = roundKey[14];
    tempWord[2] = roundKey[15];
    tempWord[3] = roundKey[12];
    printf("tempWord: %s\n", tempWord);

    // SubBytes
    for (i=0; i<4; i++) {
        tempWord[i] = sBox[(int)tempWord[i]];
    }
    printf("tempWord: %s\n", tempWord);

    // RCon XOR
    tempWord[0] = tempStore[0] ^ tempWord[0] ^ curRCon;
    printf("tempWord: %s\n", tempWord);

    // copy tempWord back to tempStore
    for (i=0; i<4; i++) {
        tempStore[i] = tempWord[i];
    }
    printf("tempStore: %s\n", tempStore);

    // Calculate other 3 words
    for (i=1; i<4; i++) {
        for (j=0;j<4;j++) {
            // XOR each bit of the W(i-4) and W(i-1) to get W(i)
            tempStore[(i*4)+j] = tempStore[((i-1)*4)+j] ^ roundKey[(i*4)+j];
        }
    }
    printf("tempStore: %s\n", tempStore);

    // Calculate next RCon
    curRCon = (curRCon<<1) ^ (0x11b & -(curRCon>>7)); // REVISIT THIS MUST BE STORED

    // Move new round key to new slot
    strcpy(roundKey,tempStore);

}

void addRoundKey(unsigned char* state,unsigned char* roundKey) {
    int i;
    for (i=0; i<16; i++) {
        state[i] = state[i] ^ roundKey[i];
    }
}

void subBytes() {}

void shiftRows() {}

void mixColumns() {}

void aesEncrypt(unsigned char * key, unsigned char * message, size_t lenMessage, unsigned char * result) {
    int i, j, k;
    unsigned char state[17];
    unsigned char tempResult[lenMessage+1];
    unsigned char roundKey[17];
    // Initialise roundKey
    roundKey[16] = '\0';
    state[16] = '\0';
    tempResult[lenMessage] = '\0';
    strcpy(roundKey,"0000000000000000");
    for (i=0; i<16; i++) {
        roundKey[i] = key[i];
    }
    printf("roundKey start: ");
    for (i=0;i<16;i++) {
        printf("%02x", roundKey[i]);
    }
    printf("\n");
    // Iterate over given message in blocks of 16 bytes
    for (j=0;j<lenMessage;j=j+16) {
        // Get the state as 16 bytes of message
        memcpy(state, &message[j], 16);
        // Null terminate string
        state[16] = '\0';
        printf("State: %s\n", state);
        addRoundKey(state, roundKey);

        for(i=0;i<loopItrs;i++) {
            subBytes();
            shiftRows();
            mixColumns();
            addRoundKey(state, roundKey);
            // Generate next roundKey
            getRoundKey(roundKey);
            // printf("Round Key %d: %s\n", i, roundKey);

            printf("roundKey %d: ", i);
            for (i=0;i<16;i++) {
                printf("%02x", roundKey[i]);
            }
            printf("\n");
        }

        subBytes();
        shiftRows();
        addRoundKey(state, roundKey);

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

size_t genPadMessage(unsigned char* message, unsigned char* padMessage, size_t lenMessage) {
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
    // unsigned char key[]          = "0123456789ABCDEF"; // 16 ASCII (1 byte each) = 128 bits
    unsigned char key[]          = {0x2b, 0x7e, 0x15, 0x16, 0x28, 0xae, 0xd2, 0xa6, 0xab, 0xf7, 0x15, 0x88, 0x09, 0xcf, 0x4f, 0x3c}; // 16 ASCII (1 byte each) = 128 bits
    unsigned char message[]      = "This is a test!!"; // A message of any length
    unsigned char *padMessage    = malloc(256);
    size_t lenPadMessage;
    size_t lenMessage;
    unsigned char result[msgBytes];
    lenMessage = sizeof(message) - 1 ;
    lenPadMessage = genPadMessage(message, padMessage, lenMessage);
    printf("PadMessage: %s\n", padMessage);
    aesEncrypt(key, padMessage, lenPadMessage, result);

    printf("Result: %s", result);

    return 0;
}
