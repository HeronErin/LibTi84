

#include <stdbool.h>

#define USE_LINE
#define WAIT_128
#define RENDER_NUMS
#define USE_GET_RANDOM
#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/raw_display.c"

#include "../../src/menu.c"



int player_y;
int player_vel;
int enemy_y;




#define paddle_len 15
#define paddle_width 2
#define Y_MID (YMAX/2)-(paddle_len/2)

#define PLAYER_X 2
#define ENEMY_X XMAX-paddle_width-PLAYER_X


void paddle(int x, int y){
    line(x, y, x+paddle_width, y);
    line(x, y+paddle_len, x+paddle_width, y+paddle_len);

    line(x, y, x, y+paddle_len);
    line(x+paddle_width, y, x+paddle_width, y+paddle_len);
}


// bool bit(char inp, char loc){
//     __asm
//         ld a, 5 (ix)
//         ld b, 4 (ix)
        
//         bit 0, 4 (ix)
//         jr Z, not_set
//         ld hl, #0x0001
//         jr end_bin
// not_set:
//         ld hl, #0x0000
// end_bin:


//     __endasm;
//     // number(inp);
//     // number(loc);
//     // return true;
//     // return inp == 4;
// }
#include<stdio.h>

// char status(){
//     __asm
//         in a,(0x10)
//         ld l, a
//     __endasm;
// }

#define VARBIN        0x9872



void main() {
    clearscreen();
    init_graphics();

    // bool b = bit(0x0F, 1);

    // number(status());
    resetcursor();
    badclr();
    // line(10, 10, 20, 20);
    // ds(0, 0, 0x0F);
    // fast_fill();
    bb();
    getKey();


    // bool update = true;
    // player_y=Y_MID;
    // enemy_y=Y_MID;
 
    // while (true){


    //     badclr();
        
    //     int key = getKeyId();
    //     if (key != 0){
    //         if (key == 0x0F)
    //             return;
    //         else if (key == 1){ // down
    //             // dir=3;
    //             player_vel+=3;
    //         }

    //         else if (key == 4){ // up
    //             player_vel-=3;
    //             // dir=2;
    //         }

    //     }
    //     player_y+=player_vel;
    //     if (player_y < 0)
    //         player_y=0;
    //     else if (player_y > (YMAX-paddle_len))
    //         player_y = YMAX-paddle_len;
    //     if ((player_vel == 1) | player_vel == -1){
    //         player_vel=0;
    //     }
    //     if (player_vel > 0){
    //         player_vel=(player_vel - (player_vel/3))-1;
    //     }
    //     else if (player_vel < 0){
    //         player_vel=(player_vel - (player_vel/3))+1;
    //     }
    //     paddle(PLAYER_X, player_y);
    //     paddle(ENEMY_X, enemy_y);

    //     swap();

    //     resetcursor();


    // }

    // getKey();



}
