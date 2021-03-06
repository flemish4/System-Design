#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int loopItrs = 9;
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

unsigned char inv_sBox[256] =
 {
    0x52, 0x09, 0x6A, 0xD5, 0x30, 0x36, 0xA5, 0x38, 0xBF, 0x40, 0xA3, 0x9E, 0x81, 0xF3, 0xD7, 0xFB,
    0x7C, 0xE3, 0x39, 0x82, 0x9B, 0x2F, 0xFF, 0x87, 0x34, 0x8E, 0x43, 0x44, 0xC4, 0xDE, 0xE9, 0xCB,
    0x54, 0x7B, 0x94, 0x32, 0xA6, 0xC2, 0x23, 0x3D, 0xEE, 0x4C, 0x95, 0x0B, 0x42, 0xFA, 0xC3, 0x4E,
    0x08, 0x2E, 0xA1, 0x66, 0x28, 0xD9, 0x24, 0xB2, 0x76, 0x5B, 0xA2, 0x49, 0x6D, 0x8B, 0xD1, 0x25,
    0x72, 0xF8, 0xF6, 0x64, 0x86, 0x68, 0x98, 0x16, 0xD4, 0xA4, 0x5C, 0xCC, 0x5D, 0x65, 0xB6, 0x92,
    0x6C, 0x70, 0x48, 0x50, 0xFD, 0xED, 0xB9, 0xDA, 0x5E, 0x15, 0x46, 0x57, 0xA7, 0x8D, 0x9D, 0x84,
    0x90, 0xD8, 0xAB, 0x00, 0x8C, 0xBC, 0xD3, 0x0A, 0xF7, 0xE4, 0x58, 0x05, 0xB8, 0xB3, 0x45, 0x06,
    0xD0, 0x2C, 0x1E, 0x8F, 0xCA, 0x3F, 0x0F, 0x02, 0xC1, 0xAF, 0xBD, 0x03, 0x01, 0x13, 0x8A, 0x6B,
    0x3A, 0x91, 0x11, 0x41, 0x4F, 0x67, 0xDC, 0xEA, 0x97, 0xF2, 0xCF, 0xCE, 0xF0, 0xB4, 0xE6, 0x73,
    0x96, 0xAC, 0x74, 0x22, 0xE7, 0xAD, 0x35, 0x85, 0xE2, 0xF9, 0x37, 0xE8, 0x1C, 0x75, 0xDF, 0x6E,
    0x47, 0xF1, 0x1A, 0x71, 0x1D, 0x29, 0xC5, 0x89, 0x6F, 0xB7, 0x62, 0x0E, 0xAA, 0x18, 0xBE, 0x1B,
    0xFC, 0x56, 0x3E, 0x4B, 0xC6, 0xD2, 0x79, 0x20, 0x9A, 0xDB, 0xC0, 0xFE, 0x78, 0xCD, 0x5A, 0xF4,
    0x1F, 0xDD, 0xA8, 0x33, 0x88, 0x07, 0xC7, 0x31, 0xB1, 0x12, 0x10, 0x59, 0x27, 0x80, 0xEC, 0x5F,
    0x60, 0x51, 0x7F, 0xA9, 0x19, 0xB5, 0x4A, 0x0D, 0x2D, 0xE5, 0x7A, 0x9F, 0x93, 0xC9, 0x9C, 0xEF,
    0xA0, 0xE0, 0x3B, 0x4D, 0xAE, 0x2A, 0xF5, 0xB0, 0xC8, 0xEB, 0xBB, 0x3C, 0x83, 0x53, 0x99, 0x61,
    0x17, 0x2B, 0x04, 0x7E, 0xBA, 0x77, 0xD6, 0x26, 0xE1, 0x69, 0x14, 0x63, 0x55, 0x21, 0x0C, 0x7D
 };


void getRoundKey(unsigned char* roundKey, unsigned char *curRCon) {
    int i,j, k;
    unsigned char tempWord[4];

    // Calculating the first column
    // RotWord - Rotate the last column left
    tempWord[0] = roundKey[13];
    tempWord[1] = roundKey[14];
    tempWord[2] = roundKey[15];
    tempWord[3] = roundKey[12];

    // SubBytes
    for (i=0; i<4; i++) {
        tempWord[i] = sBox[(int)tempWord[i]];
    }

    // RCon XOR - Col(i-4) XOR Col(i) XOR Rcon
    // Previous key of current column XOR current column XOR Rcon
    // RCon is zero for rows 1-3 in every column
    // This means RCon can be stored as a single byte, only representing the first byte
    tempWord[0] = roundKey[0] ^ tempWord[0] ^ *curRCon;
    // XOR other three rows with previous key column - Rcon == 0 for all these values
    for (i=1; i<4; i++) {
        tempWord[i] = roundKey[i] ^ tempWord[i];
    }

    // copy over old roundKey - old column not required anymore
    // This means there only needs to be one memory location for roundKey plus one tempWord
    for (i=0; i<4; i++) {
        roundKey[i] = tempWord[i];
    }

    // Calculate other 3 columns
    for (i=1; i<4; i++) {
        for (j=0;j<4;j++) {
            // XOR each bit of the W(i-4) and W(i-1) to get W(i) - Copy over old column
            roundKey[(i*4)+j] = roundKey[((i-1)*4)+j] ^ roundKey[(i*4)+j];
        }
    }

    // Calculate next RCon
    *curRCon = (*curRCon<<1) ^ (0x11b & -(*curRCon>>7));    // 0000 0010 - SHL
                                                            // 0000 0100 - SHL
                                                            // 0000 1000 - SHL
                                                            // 0001 0000 - SHL
                                                            // 0010 0000 - SHL
                                                            // 0100 0000 - SHL
                                                            // 1000 0000 - SHL
                                                            // 0001 1011 - Magic - maybe worth having a special case
                                                            // 0011 0110 - Magic - for these last two to avoid >>7 each time
}

void addRoundKey(unsigned char* state,unsigned char* roundKey) {
	int i;
    for (i=0; i<16; i++) {
        state[i] = state[i] ^ roundKey[i];
    }
}

void decRoundKey(unsigned char* state,unsigned char* roundKey) {
	int i;
	for (i=16; i>0; i--){
		state[i] = state[i] ^ roundKey[i];
	}
}

void subBytes(unsigned char* state) {
	int i;
    for (i=0; i<16; i++) {
        state[i] = sBox[(int)state[i]];
    }
}


void shiftRows(unsigned char* state) {
    int i;
    unsigned char tempRow[16];
    tempRow[0]=state[0];
    tempRow[1]=state[5];
    tempRow[2]=state[10];
    tempRow[3]=state[15];
    tempRow[4]=state[4];
    tempRow[5]=state[9];
    tempRow[6]=state[14];
    tempRow[7]=state[3];
    tempRow[8]=state[8];
    tempRow[9]=state[13];
    tempRow[10]=state[2];
    tempRow[11]=state[7];
    tempRow[12]=state[12];
    tempRow[13]=state[1];
    tempRow[14]=state[6];
    tempRow[15]=state[11];

    for(i=0; i<16 ; i++) {
        state[i]=tempRow[i];
    }
}

void undo_shiftRows(unsigned char* state) {
    int i;
    unsigned char tempRow[16];
    tempRow[0]=state[0];
    tempRow[1]=state[13];
    tempRow[2]=state[10];
    tempRow[3]=state[7];
    tempRow[4]=state[4];
    tempRow[5]=state[1];
    tempRow[6]=state[14];
    tempRow[7]=state[11];
    tempRow[8]=state[8];
    tempRow[9]=state[5];
    tempRow[10]=state[2];
    tempRow[11]=state[15];
    tempRow[12]=state[12];
    tempRow[13]=state[9];
    tempRow[14]=state[6];
    tempRow[15]=state[3];

    for(i=16; i<0 ; i--) {
        state[i]=tempRow[i];
    }
}

void mixColumns(unsigned char* state) {

    unsigned char a[16];
    unsigned char b[16];
    unsigned char c;
    unsigned char h;
    int i,k;
	printf("MC_IN: ");
        for (k=0;k<16;k++) {
            printf("%02x", state[k]);
        }
        printf("\n");
    for (c = 0; c < 16; c++) {
        //copy state to a
        a[c] = state[c];

        // set b = state * 2
        // fill h with MSB of state[c], either 1111 1111, or 0000 0000
        h = (unsigned char)((signed char)state[c] >> 7);
        // left shift multiplies by 2,
        b[c] = state[c] << 1;
        // 00011011 AND h, makes it so reduction only occurs if state[c] MSB = 1,
        // reduction by 00011011 as only 8 bits are stored, can assume the 9th bit (MSB) was a 1 if MSB of state[c] was 1
        b[c] ^= 0x1B & h;
    }
    //run through 4 bytes at a time until multiplier matrix has been fully rotated
    for (i=0;i<16;i+=4){

    state[i] = b[i] ^ a[i+3] ^ a[i+2] ^ b[i+1] ^ a[i+1];
    state[i+1] = b[i+1] ^ a[i] ^ a[i+3] ^ b[i+2] ^ a[i+2];
    state[i+2] = b[i+2] ^ a[i+1] ^ a[i] ^ b[i+3] ^ a[i+3];
    state[i+3] = b[i+3] ^ a[i+2] ^ a[i+1] ^ b[i] ^ a[i];

    }
	printf("MC_out: ");
        for (k=0;k<16;k++) {
            printf("%02x", state[k]);
        }
        printf("\n");
}




void aesEncrypt(unsigned char * key, unsigned char * message, size_t lenMessage, unsigned char * result) {
    int i, j, k;
    unsigned char state[17];
    unsigned char tempResult[lenMessage+1];
    unsigned char roundKey[17];
    unsigned char curRCon = 0x01;
    roundKey[16] = '\0';
    state[16] = '\0';
    tempResult[lenMessage] = '\0';
    // Iterate over given message in blocks of 16 bytes
    for (j=0;j<lenMessage;j=j+16) {
        // Initialise roundKey
        for (i=0; i<16; i++) {
            roundKey[i] = key[i];
        }

        // Get the state as 16 bytes of message
        memcpy(state, &message[j], 16);
        state[16] = '\0';

        //Initial addRoundKey
        addRoundKey(state, roundKey);
        printf("key 0: ");
        for (k=0;k<16;k++) {
            printf("%02x", roundKey[k]);
        }
        printf("\n");

        // Loop 9 times
        for(i=0;i<loopItrs;i++) {
            //printf("Start of loopItrs\n");
            getRoundKey(roundKey, &curRCon);
            subBytes(state);
            shiftRows(state);
            mixColumns(state);
            addRoundKey(state, roundKey);

            printf("key %d: ", i+1);
            for (k=0;k<16;k++) {
                printf("%02x", roundKey[k]);
            }
            printf("\n");

        }

        getRoundKey(roundKey, &curRCon);
        subBytes(state);
        shiftRows(state);
        addRoundKey(state, roundKey);
        printf("key 0: ");
        for (k=0;k<16;k++) {
            printf("%02x", roundKey[k]);
        }
        printf("\n");
        printf("state end: ");
        for (k=0;k<16;k++) {
            printf("%02x", state[k]);
        }
        printf("\n");
        // Collect the results in tempResult
        k=0;
        for (i=j;i<j+16;i++) {
            tempResult[i] = state[k++];
        }
    }
    // Return a pointer to the results
    strcpy(result,tempResult);

}

/*
void aesDecript (){
    // These may not all be necessary
    int i, j, k;
    unsigned char state[17];
    unsigned char roundKey[17];
    unsigned char curRCon = 0x01;

	//initial round

	decRoundKey(state, roundKey);
	undo_shiftRows(state);

	//inv_SubBytes

	//9 further rounds

	decRoundKey(state, roundKey);

	//inv_mixColumns
	undo_shiftRows(state);
	//inv_subBytes

}
*/
size_t genPadMessage(unsigned char* message, unsigned char* padMessage, size_t lenMessage) {
    int i;
    int lenPad = 0;
    int lenMesRem  = lenMessage % 16;
    strcpy(padMessage,message);
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
    // unsigned char key[]          = {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}; // 16 ASCII (1 byte each) = 128 bits
    // unsigned char message[]      = "This is a test!!"; // A message of any length
    unsigned char message[]      = {0x32, 0x43, 0xf6, 0xa8, 0x88, 0x5a, 0x30, 0x8d, 0x31, 0x31, 0x98, 0xa2, 0xe0, 0x37, 0x07, 0x34}; // A message of any length
    unsigned char *padMessage    = malloc(256);
    size_t lenPadMessage;
    size_t lenMessage;
    unsigned char result[msgBytes];
    lenMessage = sizeof(message);
    printf("lenMessage: %d",lenMessage);
    lenPadMessage = genPadMessage(message, padMessage, lenMessage);
    aesEncrypt(key, padMessage, lenPadMessage, result);
    return 0;
}
