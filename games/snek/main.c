

#include <stdbool.h>

#define USE_LINE
#define MIN_MAX
#define WAIT_128
#define RENDER_NUMS
#define MAKE_MENUS
#define USE_GET_RANDOM
#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/menu.c"







#include<stdio.h>



#define VARBIN        0x9872

#define BLOCKSIZE      4

// #define FULL_BLOCK
#define HALF_BLOCK


#define MOVE_SPEED     2

#define MAX_LENGTH 50
#define LENGTH_BYTES 200


#ifdef HALF_BLOCK
    #define XLEN (XMAX/BLOCKSIZE)
#endif
#ifdef FULL_BLOCK
     #define XLEN (XMAX/BLOCKSIZE*2)
#endif


#define YLEN (YMAX/BLOCKSIZE)
int hx, hy;
int ax, ay;
int bklen;
int *bx, *by;
#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);



unsigned int Vtrack;
void drawblock(int x, int y){
    int xa = (y*BLOCKSIZE*12)+ (x / 2);
    #ifdef FULL_BLOCK
    for (int i = 0; i < BLOCKSIZE; i++)
        buff[(i*12) + xa] |= 0xFF;
    #endif
    #ifdef HALF_BLOCK
        char st = x%2==0?0xF0:0x0F;
        
        for (int i = 0; i < BLOCKSIZE; i++)
            buff[(i*12) + xa] |= st;
    #endif

}
void drawapple(int x, int y){
    int xa = (y*BLOCKSIZE*12)+ (x / 2);
    #ifdef HALF_BLOCK
        char st = x%2==0?0xF0:0x0F;
        char md1 = x%2==0?0xB0:0x0B;
        char md2 = x%2==0?0x90:0x09;
        buff[xa] = st;
        buff[xa+12] = md1;
        buff[xa+24] = md2;
        buff[xa+36] = st;
    #endif
    #ifdef FULL_BLOCK
        buff[xa] =        0xFF;
        buff[xa+(1*12)] = 0xFF;
        buff[xa+(2*12)] = 0xC3;
        buff[xa+(3*12)] = 0xC3;
        buff[xa+(4*12)] = 0xC3;
        buff[xa+(5*12)] = 0xC3;
        buff[xa+(6*12)] = 0xFF;
        buff[xa+(7*12)] = 0xFF;

        

    #endif

}

void move(int *x, int *y, char dir){
    if (dir == 0){
        *x+=1;
    }else if (dir == 1){
        *x-=1;
    }else if (dir == 2){
        *y-=1;
    }else if (dir == 3){
        *y+=1;
    }
}
bool checkCol(int x, int y){
    for (int i = 0; i < bklen; i++){
        if (bx[i] == x && by[i] == y)
            return true;
    }
    return false;
}
void makeApple(){
    do{
        ax = randomInt()%XLEN;
        ay = randomInt()%YLEN;
    }
    while (checkCol(ax, ay) | (ax == hx && ay == hy));
}
int hardness;
void main() {
    bool update = true;
    bool going = false;
    bool justAdd = false;
    makeApple();
    clearscreen();
    // getTime();
    // newline();
    // bcall(0x515E);
    // print((char*)())
    print("Select difficulty:");
    menu_putstr("Easy", 1);
    menu_putstr("Easyish", 2);
    menu_putstr("Medium", 3);
    menu_putstr("Mediumish", 4);
    menu_putstr("Hard", 5);
    menu_putstr("Kill me", 6);
    menu_putstr("Im already dead", 7);
    hardness=menu_loop();

    bklen = 0;
    hx = XLEN/2; hy = YLEN/2;
    bx = (int*) ( VARBIN );
    by = (int*) ( VARBIN+LENGTH_BYTES );


    unsigned int ticker = 0;


    char dir = 0;


    init_graphics();



    while (true){

        ticker+=1;

        

        int key = getKeyId();
        if (key != 0){
            if (key == 0x0F){
                break;
            }
            else if (key == 1){ // down
                dir=3;
            }

            else if (key == 4){ // up
                dir=2;
            }

            else if (key == 2){ // left
                dir=1;
            }
            else if (key == 3){ // right
                dir=0;
            }

        }



        if (update){
            int tx = hx, ty = hy;

            for(int ii = bklen -1; ii > 0; ii--)
            {
                 bx[ii] = bx[ii-1];
                 by[ii] = by[ii-1];
            }
            bx[0] = hx;
            by[0] = hy;
            move(&hx, &hy, dir);

            if (hx >= XLEN){
                hx = 0;
            }else if (hx < 0){
                hx = XLEN-1;
            }
            if (hy >= YLEN){
                hy = 0;
            }else if (hy < 0){
                hy = YLEN;
            }
            // move(&hx, &hy, dir);

            if (checkCol(ax, ay) | (ax == hx && ay == hy)){
                for (int iii = bklen-1; iii < bklen+hardness; iii++){
                    bx[iii] = bx[0];
                    by[iii] = by[0];
                }
                bklen+=hardness;
                makeApple();
            }
            if (checkCol(hx, hy))
                break;





            badclr();
            drawapple(ax, ay);
            drawblock(hx, hy);
            for (int i = 0; i < bklen; i+=1){
                drawblock(bx[i], by[i]);

            }
        } update = !update;

        swap();
        number(bklen/hardness);
        resetcursor();
        if (bklen<30)
            wait128(6-(bklen/5));

    }

    // getKey();



}
