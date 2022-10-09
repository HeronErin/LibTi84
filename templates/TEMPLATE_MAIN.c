
// switches to reduce output file size
// defines what functions are addeds
#define USE_PRINT_FUNCS

#include "../../src/setting.h"

#include "../../src/libti.c"

#include "../../src/graphics.c"



#include "../../src/fixedpoint.h"
#define VARBIN        0x9872





void main() {
    clearscreen(); // reset text based output on screen

    init_graphics(); // make buff a char* to the screen buffer

    print("hello world");

    getKey(); // wait for user input before exiting


}
