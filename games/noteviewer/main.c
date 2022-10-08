

#include <stdbool.h>






#define WAIT_8
#define USE_DRAW_BITMAP_STRIPED
#define USE_GET_INFO
#define RENDER_NUMS


#include<stdio.h>
#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"
#include "../../src/assetManager.c"



#define VARBIN        0x9872


#define _LCD_BUSY_QUICK 0x000B


unsigned int Vtrack;





void main() {
    init_graphics();
    
    char* loc = getInfo("\x15notes\0\0");


    clearscreen();
    number(loc[0]);newline();
    number(loc[1]);newline();
    number(loc[2]);newline();
    number(loc[3]);newline();
    newline();
    number((int)loc);


    
    getKey();
}
