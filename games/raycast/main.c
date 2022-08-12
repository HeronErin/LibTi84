

#include <stdbool.h>

#define USE_SQRT

#define RENDER_NUMS
#define USE_LINE

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


#define DMIR 1
#define YMULT 1
void main() {
    int px = 3;
    int py = 8;
    int rot = 0;

    char map[] = {
        1, 1, 1, 0, 1, 1,
        1, 0, 1, 0, 0, 1,
        1, 0, 1, 0, 0, 1, 
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1
    };




    clearscreen();
    init_graphics();
    



    // for (int x = 0; x < mapX; ++x){
    //     for (int y = 0; y < mapY; ++y){
    //         if (map[x + (y*mapX)]==1){
    //             buff[x + (y*XMAX)] = 0xFF;
    //             buff[x + (y*XMAX) + (7*XMAX/8)] = 0xFF;
    //             for(int i = 1; i < 7; ++i){
    //                 buff[x + (y*XMAX) + (i*XMAX/8)] = 0x81;
    //             }


    //         }
    //     }
    // }

    // line(px*8, py*8, (px+1)*8, (1+py)*8);
    // line((px)*8, (1+py)*8, (px+1)*8, py*8);

    // printc('a');
    bool update = true;
    while (true){

        int key = getKeyId();
        if (key != 0){
            if (key == 0x0F){
                break;
            }
            else if (key == 1){ // down
                py+=1;
            }

            else if (key == 4){ // up
                py-=1;
            }

            else if (key == 2){ // left
                px-=1;
            }
            else if (key == 3){ // right
                px+=1;
            }
            update=true;

        }



        if (update){
            update=false;
            badclr();
            int v = XMAX/DMIR;
            int m;
            for (int i = 0; i < v; ++i){
                int cameraX = 2 * i*100 / v - 100;
                int rx = ((px*100))+50;
                int ry = (py*100)+100;


                int rayDirX = 100;
                int rayDirY = cameraX/2;

                for (int yy = 0; yy < 32; ++yy){
                    int orx = rx; int ory = ry; int ama = rx/100 + ((ry)/100*mapX);
                        // number(ama);
                        // printc('-');
                        // number(rx);
                        // printc('-');
                        // number(ry);
                        // newline();
                        if (ama > 0 && ama < mapX*mapY){
                            if(map[ama] == 1){
                                for (int d = 0; d < DMIR; ++d){
                                    line(i*DMIR+d, yy*YMULT, i*DMIR+d, YMAX-(yy*YMULT));
                                }
                                break;
                            }
                        }
                        ry-=rayDirX/2;
                        rx+=rayDirY/2;

                        // line(rx/100*8, ry/100*8, orx/100*8, ory/100*8);

                           

                }
                
            }
            swap();
        }



        

        // break;
            
    }



    
    // printc('a');
    // int v = XMAX/4;
    // int m;
    // for (int i = 0; i < v; ++i){
    //     int cameraX = 2 * i*100 / v - 100;
    //     int rx = px;
    //     int ry = ry;


    //     int rayDirX = 100;
    //     int rayDirY = cameraX/2;


    // }
    // printc('a');
    // number(m);

    getKey();



}
