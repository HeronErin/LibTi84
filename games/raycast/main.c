#include <stdbool.h>

// #define USE_PRINT_FUNCS

#define USE_CPU_SPEED
#define USE_PRINT_FUNCS
#define RENDER_NUMS
#define USE_GET_TIME
#include "../../src/setting.h"

#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/portMagic.c"

#include "../../src/floatmath.c"

// #include "../../src/fixedpoint.h"
#define VARBIN        0x9872







#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);



void main() {
    clearscreen();
    volatile char mtest = 0;
    setCpuSpeed(3);

    OP1Set3();
    OP2Set5();

    FP_MULT();

    PRINT_OP1;
    newline();
    number(OPT1_TO_INT());

    

    getKey();

}
