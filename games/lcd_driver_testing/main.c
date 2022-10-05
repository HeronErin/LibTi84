

#include <stdbool.h>





#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/portMagic.c"




#include<stdio.h>



#define VARBIN        0x9872


#define _LCD_BUSY_QUICK 0x000B


unsigned int Vtrack;





void main() {
    init_graphics();

    
    clearscreen();
    badclr();
}
