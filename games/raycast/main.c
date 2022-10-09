#include <stdbool.h>

#define USE_PRINT_FUNCS
#define RENDER_NUMS
#include "../../src/setting.h"

#include "../../src/libti.c"

#include "../../src/graphics.c"



#include "../../src/fixedpoint.h"
#define VARBIN        0x9872







#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);


void main() {
    clearscreen();

    char out[50];
    FXstr(
        FIXEDPT_TWO+FIXEDPT_PI

        , (char*)&out);
    print((char*)&out);

    getKey();


}
