

#include <stdbool.h>

#define USE_LINE
#define RENDER_NUMS

#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"






#include<stdio.h>



#define VARBIN        0x9872

#define BLOCKSIZE      4



#define MOVE_SPEED     2

#define WIDTH 6
#define HEIGHT 7


#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);



unsigned int Vtrack;
#define WIDTH 8
void main() {
    int px = 3;
    int py = 5;
    int rot = 0

    char[] world = {
        1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 1,
        1, 1, 1, 0, 0, 0, 
        1, 1, 0, 0, 0, 0,
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 0,
        1, 1, 1, 1, 1, 1
    };
    char* rotworld = (char*) VARBIN ;
    for (int i = 0; i < sizeof(world); ++i){
        rotworld[i] = world[i];
    }



    clearscreen();






    init_graphics();
    badclr();

    swap();


    getKey();



}
