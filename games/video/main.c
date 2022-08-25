

#include <stdbool.h>


#define RENDER_NUMS
#define WAIT_128
#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"





// Online C Compiler - Build, Compile and Run your C programs online in your favorite browser

#include<stdio.h>



#define VARBIN        0x9872
#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);


unsigned int Vtrack;
void nullcp(char* to, char* from){
	for (int i =0; i < 10; ++i){
		to[i] = from[i];
		if (from[i] == 0)
			break;
	}
}

// char img[] = {0x07, 0x7e, 0x3f, 0x78, 0x5f, 0x93, 0x00, 0x3c, 0x03, 0xef, 0x17, 0xf1, 0xfd, 0x01, 0xb8, 0x2f, 0x80, 0xfb, 0x01, 0xfe, 0x00, 0x03, 0x07, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xf0, 0xdf, 0xfc, 0xff, 0xfc, 0xbf, 0xf0, 0xe4, 0x0b, 0xff, 0x36, 0x97, 0xfe, 0x02, 0x0f, 0xfc, 0x94, 0x2f, 0xfa, 0xbf, 0xf5, 0x4b, 0xfe, 0xa9, 0xff, 0x8a, 0xa7, 0xfe, 0x2a, 0x99, 0xfc, 0x55, 0x33, 0xf8, 0xaa, 0x67, 0xf1, 0x54, 0xff, 0xc5, 0x53, 0xff, 0x15, 0x4f, 0xfc, 0x55, 0x2f, 0xf1, 0x54, 0xbf, 0xea, 0xff, 0xd5, 0xff, 0xa9, 0x1f, 0xf9, 0x28, 0x5f, 0xf0, 0x13, 0x5f, 0xf3, 0x68, 0x3f, 0xf1, 0x4f, 0xff, 0x93, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
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
int loc;
char* cchunck;
int* ichuncks;
char fsize;

char imgind(int x){
    return cchunck[1+(fsize*4)+x];
}
int boff;
int curr;

unsigned lind(int x){
	return ichuncks[x*2];
    // x;
    // __asm
    //     ld  c, 4 (ix)
    //     ld  b, 5 (ix)
    //     sla c
    //     rl  b
    //     ld  hl, #__xinit__lens
    //     add hl, bc
    //     ld  c, (hl)
    //     inc hl
    //     ld  h, (hl)
    //     ld  l, c
    // __endasm;
}






#include "huffman.c"
void main() {

	int chunck = 0;
	char *a[] = {"\x15TCK00\0", "\x15TCK01\0", "\x15TCK02\0", "\x15TCK03\0", "\x15TCK04\0", "\x15TCK05\0", "\x15TCK06\0"};
    
    boff=0;
    Vtrack = VARBIN;

    init_graphics();
    clearscreen();
    archiveToggle(a[chunck]);
    loc = getInfo(a[chunck])+2;
    cchunck = (char*)(loc);
    ichuncks = (int*)(loc+1);
    fsize = cchunck[0];
 //    number(fsize);
 //    newline();
 //    for (int i = 0; i < 8; ++i){
 //    	number(cchunck[i]);
 //    	newline();
	// }
	// for (int i = 0; i < 8; ++i){
	// 	number(lind(i));
	// 	newline();	
	// }
	

    // getKey();

    // clearscreen();
    // for (int x = 0; x < 768; x+=1){
    //     if (img[x] != 0){
    //         number(x);
    //     }
    // }
    // run();
    // swap();
    	while (chunck < 7){
		    for (curr = 0; curr < fsize; ++curr){
		  
		        run();
		        Vtrack = VARBIN;
		        swap();
		        boff += lind(curr);
		        // wait128(5);
		        if (getKeyId() == 15)
		        	return;
		        // break;
		    }
		    archiveToggle(a[chunck]);
		    chunck++;
		    if (chunck == 7)
		    	return;
		    archiveToggle(a[chunck]);
	    
		    loc = getInfo(a[chunck])+2;
		    cchunck = (char*)(loc);
		    ichuncks = (int*)(loc+1);
		    fsize = cchunck[0];
			Vtrack = VARBIN;
			boff=0;
	}		
    // number(imgind(2));
   //  __asm
   //      ld  a, (#(__xinit__img + 0x0002) + 0)
   //      ld  c, a
   //      ld  b, #0x00
   //      push    bc
   //      call    _number
   //      pop af
   // __endasm;
    // getKey();



}
