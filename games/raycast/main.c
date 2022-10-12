#include <stdbool.h>

// #define USE_PRINT_FUNCS
#define USE_LINE

#define USE_GET_TIME
#define USE_CPU_SPEED
#define USE_CUSTOM_LCD

#include "../../src/setting.h"

#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/portMagic.c"

// #include "../../src/fixedpoint.h"
#define VARBIN        0x9872







#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);


void main() {
    clearscreen();
    init_graphics();
    badfill();

    fcopy();
    getKey();
    __asm
        rst 0x28
        .dw 0x4027
    __endasm;


}
