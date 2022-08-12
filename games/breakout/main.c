

#include <stdbool.h>

#define V_H_LINES
#define WAIT_128
#define RENDER_NUMS

#define SCREEN_SAVE





#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"




// Online C Compiler - Build, Compile and Run your C programs online in your favorite browser

#include<stdio.h>



#define VARBIN        0x9872
#define PADLEN        20
#define PADLEN_D2     10

#define BLOCKWIDTH  16
#define BLOCKHEIGHT  2

#define BLOCKSCOUNT ( XMAX/(2+BLOCKWIDTH) )
#define BLOCKDEPH   4

#define BLOCKOFF  7

#define PAD_SPEED 4
#define BALL_SPEED 2


#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);

void renderBall(int x, int y){
    hline(x-1, y-1, 3);
    hline(x-1, y+1, 3);
    setpix(x-1, y);
    setpix(x+1, y);
    setpix(x, y);
}
int bx, by;

int ballVolx, ballVoly;
void ballTick(){

}

unsigned int Vtrack;

int paddlex;

void main() {
    bool update =true;
    bool fired = false;

    char pieces[40] = {1};
    int true_piece_len = BLOCKSCOUNT * BLOCKDEPH;
    for (int i = 0; i < true_piece_len; i++){
        pieces[i] = 1;
    }

    bool hasr = false;

    init_graphics();
    paddlex = XMAX/2-PADLEN_D2;

    Vtrack = VARBIN;

    clearscreen();
    badclr();
    unsigned int ticker = 0;
    while (true){
        ticker+=1;
        if (ticker > 40000)
            ticker = 1;

        int x = getKeyId();
        if (x!=0){
            if (x==15){
                break;
            }
            else if (x == 2){ //left
                paddlex-=PAD_SPEED;
                if (paddlex < 0){
                    paddlex =0;
                }
            }
            else if (x == 3){ //right
                paddlex+=PAD_SPEED;
                if (paddlex > XMAX-PADLEN){
                    paddlex =XMAX-PADLEN;
                }
            }
            else if (x == 4){ //fire
                if (fired == false){
                    fired=true;
                    ballVolx = ticker%2==0 ? BALL_SPEED : -BALL_SPEED;
                    ballVoly = -BALL_SPEED;
                    bx = paddlex+PADLEN_D2-1;
                    by = 59;

                }
            }


            update=true;
        }

        if (update | fired==true){
                if (hasr == false){
                    badclr();
                 int xoff = (XMAX%(BLOCKWIDTH+2))/2;
  
                for (int by = 0; by < BLOCKDEPH; by++){
                    int ybk = by*(BLOCKHEIGHT+2)+BLOCKOFF;
                    for (int bx = 0; bx < BLOCKSCOUNT; bx++){
                        if (pieces[(by*BLOCKSCOUNT + bx) ]==1){
                            int bkb = bx*(BLOCKWIDTH+2)+xoff;
                            hline(bkb, ybk, BLOCKWIDTH);
                            vline(bkb, ybk, BLOCKHEIGHT);
                            vline(bkb+BLOCKWIDTH, ybk, BLOCKHEIGHT);
                            hline(bkb, ybk+BLOCKHEIGHT, BLOCKWIDTH);
                        }

                    }
                }
                saveScreenToAppBackup();
                hasr=true;
            }else{
                reviveScreenFromAppBackup();
            }
            if (fired==false){
                renderBall(paddlex+PADLEN_D2-1, 59);
            }else{
                bx+=ballVolx;
                by+=ballVoly;
                if (bx < 0 | bx > XMAX-1){
                    ballVolx = 0-ballVolx;
                    
                }
                if (by < 0 | (by > YMAX-4 && bx >paddlex-3 && bx< paddlex+PADLEN+3) ){
                    ballVoly = 0-ballVoly;
                }
                else if (by > YMAX){
                    fired = false;update=true;
                }
                int box = ((bx - (XMAX%(BLOCKWIDTH+2))/2)/(BLOCKWIDTH+2) + (by-BLOCKOFF)/(BLOCKHEIGHT+2)*BLOCKSCOUNT);
                if (box < true_piece_len && box >= 0){
                    if (pieces[box]!=0){
                        pieces[box]=0;
                        hasr=false;
                        ballVoly = 0-ballVoly;
                    }
                }
                renderBall(bx, by);
            }

            hline(paddlex, 63, PADLEN);
            hline(paddlex, 62, PADLEN);
            hline(paddlex, 61, PADLEN);



            swap();
            update=false;
            // wait128(10);
        }


    }



    



}
