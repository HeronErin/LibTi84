

#include <stdbool.h>






#define WAIT_8
#define USE_LINE
#define RENDER_NUMS

#define USE_GET_TIME
#define USE_CPU_SPEED
#define USE_CUSTOM_LCD


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
    // bcall(0x4ab1);
    // bcall(_LCD_BUSY_QUICK);
    //LD     A, #(0x05 | 0x81 | 0x21)
    // setCpuSpeed(1);
    // number(getCpuSpeed());
    // setCpuSpeed(0);
    int btime = getTime();
    int ctime = 0;
    while (ctime < 4){
        ctime = getTime()-btime;
        number(4-ctime);
        wait(1);
        clearscreen();
    }

    
    setLCD_FULL(0xFF);
    wait(16);
    line(0, 0, 50, 50);
    line(40, 10, 50, 40);
    fcopy();
    btime = getTime();
    ctime = 0;
    while (ctime < 5){
        ctime = getTime()-btime;
        wait(1);
    }
    setCpuSpeed(0);
    btime = getTime();
    volatile int c = 0;
    while (c < 5000){
        c++;
    }
    clearscreen();

    number(getTime()-btime);
    setCpuSpeed(1);
    btime = getTime();
    c = 0;
    while (c < 5000){
        c++;
    }
    newline();
    number(getTime()-btime);
    setCpuSpeed(0);
    getKey();
}
