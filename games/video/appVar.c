

#include <stdbool.h>

#define RENDER_NUMS


#define VAR_PREFIX 0x15

#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"
void nullcp(char* to, char* from){
	for (int i =0; i < 10; ++i){
		to[i] = from[i];
		if (from[i] == 0)
			break;
	}
}
unsigned int make(short size, char* name){
	size;
	nullcp((char*)(0x8478), name);
    
    __asm
		ld	l, 4 (ix)
		ld	h, 5 (ix)
    __endasm;
    // __asm
    // 	ld hl,(10)
    // __endasm;
    bcall(0x4E6A);
	__asm
		ld l, d
		ld h, e
	__endasm;
	// return t;
	// return 0x4E6A;
}
int getInfo(char* name){
	
    nullcp((char*)(0x8478), name);
    char br = name[0];
    
    bcall(0x42F1);
	__asm
    	ld a, b
    __endasm;
    
    if (br != 0)
    	return br;
    else{
    	__asm
			ld h, d
			ld l, e
    	__endasm;
    }

}
void archiveToggle(char* name){	
    nullcp((char*)(0x8478), name);
    bcall(0x4FD8);
}
void main() {
    


    init_graphics();

    clearscreen();
    // archiveToggle("\x15OWO\0");
    char* pos = (char*) getInfo("\x15OWO\0");
    if (pos != 0){
	    for (int i = 0; i <10; i++){
	    	printc(pos[i+2]);
	    }
	}
    // unsigned int dddd = make(200, "\x15MAIN\0")+2;

    // unsigned int dddd = 0xE0AB;
    // char* d2 = &dddd;
    
    // char* dir = (char*)(dddd);
    // number(d2[0]);
    // printc('-');
    // number(d2[1]);
    // newline();
    // printc('-');
    // newline();
    // for (int i = 0 ; i < 10; ++i){
    	// dir[i+5] = 0xFF;
    // }
    // for (int i = 0 ; i < 5; ++i){
    // 	number(dir[i]);
    // 	newline();
    // }


    // int* dout = (int*)(0x8798);
    // *dout = dir;

    // char* data = (char*)((*dout)+2);
    // for (int i =0; i < 100; ++i){
    // 	data[i] = 0xFF;
    // }
    // number(data[4]);
    getKey();

}

