

#include <stdbool.h>


#define TANS_PRE
#define COS_PRE
#define SIN_PRE

#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"






#include<stdio.h>



#define VARBIN        0x9872

#define BLOCKSIZE      4



#define MOVE_SPEED     2

#define mapX 6
#define mapY 7







#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);



unsigned int Vtrack;




void main() {
    int px = 3;
    int py = 5;
    int rot = 0;

    char map[] = {
        1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1, 
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1
    };




    clearscreen();
    init_graphics();
    badclr();






    swap();
    

    getKey();



}
