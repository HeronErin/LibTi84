#define V_H_LINES
#define SCREEN_SAVE
#define WAIT_8
#define USE_PRINT_FUNCS
#include "../../src/setting.h"

#include "../../src/libti.c"

#include <stdbool.h>




#include "../../src/graphics.c"

#define IS_BIT_SET(value, pos) (value & (1U<< pos))

#include "imgdata.c"

bool firstscreen;
bool holdingKey;
#define FIGHT_STATE  2

#define SELECT_STATE 1

int sanScore;

void renderSansHealth(int x, int y, int perc){
    hline(x, y, 30);
    hline(x, y+5, 30);
    
    vline(x, y, 5);
    vline(x+30, y, 5);
    vline(x+ (30*10)*perc/100, y, 5);

}


void drawbitmap(int x, int y, int width, int height, char* img){
    for (int py =0; py<height; py++){
        for (int px = 0; px<width; px++){
            if((py+y)<YMAX){
                char pixbyte = img[px+(py*width)];
                int tempY = ((py+y)*12);
                if (x%8==0){
                    int pxb = px+(x/8);
                    if (pxb<12)
                        buff[tempY+pxb] = pixbyte;
                }else{  
                    for (char bp = 0; bp < 8; bp++){
                        if (IS_BIT_SET(pixbyte, (7-bp))){
                            int rx = bp+x+(px*8);
                            if (rx<XMAX)
                                buff[(rx/8) + tempY] |= 1<<(7-(rx%8));
                        }
                    }
                }

            }

        }
    }
}
int state;
bool firstrun;
#include "fight.c"
#include "select.c"
void main() {
    init_graphics();
    clearscreen();
    badclr();

    sanScore=100;

    iscursing = true;
    firstrun=true;

    state=SELECT_STATE;
    CURRENT_SEL=0;
    firstscreen=true;
    while (true){


        
        int k = getKeyId();

        if (k==0){
            holdingKey=false;
        }
        if (state == FIGHT_STATE){
            
            if(renderFight(k)){
                getKey();
                return;
            }
        }
        else if (state == SELECT_STATE){
            if(renderSel(k)){
                return;
            }
        }

    }

}
