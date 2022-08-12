

#include <stdbool.h>

#define V_H_LINES
#define WAIT_128
#define RENDER_NUMS





#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"




// Online C Compiler - Build, Compile and Run your C programs online in your favorite browser

#include<stdio.h>




#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);





#define IS_BIT_SET(value, pos) (value & (1U<< pos))
void drawbitmap(int x, int y, int height, int width, char* img){
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
int px, py;
bool isgrounded(){

    return py > YMAX-9;
}
#define VARBIN        0x9872
unsigned int Vtrack;
#define XSPEED 8
#define FALL_SPEED 4
void main() {
    
    #include "imgs.c"
    px = XMAX/2;
    py = 4;

    int xvol=0;
    int yvol=0;
    bool update = true;
    init_graphics();


    Vtrack = VARBIN;

    clearscreen();
    while (true){
        int x = getKeyId();

        if (x !=0){
            setPenCol(0);
            if (x == 15)
                break;
            else if (x == 2){
                px -=XSPEED;
            }   
            else if (x == 3){
                px +=XSPEED;
            }
            else if (x == 4){
                if (isgrounded())
                    break;
            }
            update = true;
        }
        if (xvol !=0 | yvol != 0){
            px += xvol;
            py += yvol;
            xvol = xvol - xvol/4;
            if (xvol > 0)
                xvol -=1;
            else if (xvol < 0)
                xvol +=1;
            if (yvol > 0)
                yvol -=1;
            else if (yvol < 0)
                yvol +=1;
            yvol = yvol - yvol/4;
            update = true;
        }
            if (!isgrounded()){
                yvol +=FALL_SPEED;
                if (yvol > FALL_SPEED*4){
                    yvol = FALL_SPEED*4;
                }
            }else{
                yvol = 0;
            }
        if (px < 0){
            px = 0;
        }
        if (py < 0){
            py = 0;
        }
        if (py > YMAX-16){
            py = YMAX-16;
        }
        if (px > XMAX){
            px = XMAX;
        }


        if (update){
        badclr();
        drawbitmap(px, py, 16, 3, sp1);
        swap(); 
        }

    }





    



}
