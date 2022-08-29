#include <stdbool.h>
#define RENDER_NUMS

#define USE_GET_INFO
#define RENDER_NUMSs
#define USE_ARCHIVE
#define USE_DRAW_BITMAP_STRIPED
#define USE_LINE
#define WAIT_8
#include "imgs.c"

#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/assetManager.c"



#define arrowSize 5
#define pointSize 2

void arrow(int x, int y, char rot){
    int ax = x+arrowSize;
    int ay = y+arrowSize;
    
    if (rot == 1){
        line(x, y, x, ay);
        line(x, ay, x-pointSize, ay-pointSize);
        line(x, ay, x+pointSize, ay-pointSize);
    }
    else if (rot == 0){
        line(x, y, ax, ay);
        line(ax, ay, ax-pointSize, ay);
        line(ax, ay, ax, ay-pointSize);
    }
    else if (rot == 2){
        ax-=arrowSize;
        x-=arrowSize;
        line(x, ay, ax, y);
        line(x, ay, x+pointSize, ay);
        line(x, ay, x, ay-pointSize);
        
        // line(x, y, x+pointSize, y);
        // line(x, y, x, y+pointSize);
    }
    else if (rot == 3){
        ax-=arrowSize;
        x-=arrowSize;
        ay-=arrowSize;
        y-=arrowSize;
        line(x, y, ax, ay);
        line(x, y, x+pointSize, y);
        line(x, y, x, y+pointSize);
    }
    else if (rot == 4){
        ay-=arrowSize;
        y-=arrowSize;
        line(x, y, x, ay);
        line(x, y, x-pointSize, y+pointSize);
        line(x, y, x+pointSize, y+pointSize);
    }
    else if (rot == 5){
        ay-=arrowSize;
        y-=arrowSize;
        line(x, ay, ax, y);
        line(ax, y, ax-pointSize, y);
        line(ax, y, ax, y+pointSize);
    }
}


void main() {
    int offsets[] = { 0, 26, 52, 78, 104, 130, 156, 182 };

    init_graphics();
    clearscreen();

    badclr();

    

    // swap();

    // bcall(0x4092);

    int loc = getInfo("datatale\0")+2;
    
    int* hwidth = (int*)(loc+HEART_0_WIDTH_OFF);
    int* hheight = (int*)(loc+HEART_0_HEIGHT_OFF);
    char* img = (char*)(loc+HEART_0_HEIGHT_OFF+4);
    int x = 0;

    int y = 0;

    int r = 0;
    
    while (true){
        badclr();
        int keyid = getKeyId();
        if (keyid !=0){
            if (keyid == 15){

                return;
            }
            else if (keyid == 1){ // down
                y+=2;
            }

            else if (keyid == 4){ // up
                y-=2;
            }

            else if (keyid == 2){ // left
                x-=2;

            }
            else if (keyid == 3){ // right
                x+=2;
            }
            int xddr = XMAX-((*hwidth)*4);
            if (x < 0)
                x = 0;
            else if (x > xddr)
                x = xddr;
            int off = offsets[x%8];
            hwidth = (int*)(loc+off);
            hheight = (int*)(loc+off+4);
            img = (char*)(loc+off+8);
        }
        ++r;
        r = r%6;
        drawBitmapStriped(x-(x%8), y, *hwidth, *hheight, img);
        arrow(20, 20, r);
        wait(2);


        swap();

    }
    // number(*hwidth);
    // newline();
    // number(*hheight);


    getKey();
}