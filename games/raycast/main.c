

#include <stdbool.h>

// #define USE_SQRT

#define RENDER_NUMS
#define USE_LINE
#define MIN_MAX

#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"






#include<stdio.h>



#define VARBIN        0x9872

#define BLOCKSIZE      4



#define MOVE_SPEED     2

#define mapX 4
#define mapY 12







#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);



unsigned int Vtrack;


#define DMIR 6
#define YMULT 1
void main() {
    int px = 2;
    int py = 13;
    int rot = 0;

    // char map[] = {
    //     1, 1, 1, 0, 1, 1,
    //     1, 0, 1, 0, 0, 1,
    //     1, 0, 1, 0, 0, 1, 
    //     1, 0, 0, 0, 0, 1,
    //     1, 0, 0, 0, 0, 1,
    //     1, 0, 0, 0, 0, 1,
    //     1, 0, 0, 0, 0, 1
    // };
    char map[] = {
        1, 1, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0,
        1, 0, 0, 0
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
            else if (key == 0x0A){ // plus
                rot+=1;
            }
            update=true;

        }



        if (update){
            update=false;
            badclr();
            int v = XMAX/DMIR;
            int m;
            int oldY = 0;
            for (int i = 0; i < v; ++i){
                int cameraX = 2 * i*100 / v - 100;
                int rx = ((px*100))+50;
                int ry = (py*100)+100;


                int rayDirX = 100;
                int rayDirY = cameraX/2;
                int toy = 0;
                for (int yy = 0; yy < 64; ++yy){
                    int orx = rx; int ory = ry; 


                        int ama;
                        rot%=4;
                        if (rot == 1){
                            ama = (0-ry)/100 + ((rx)/100*mapX);
                        }else if (rot == 2){
                            // *x = 0-(*x);
                            // *y = 0-(*y);
                             ama= (0-rx)/100 + ((0-ry)/100*mapX);
                        }else if (rot == 3){
                            // int temp = *x;
                            // *x = *y;
                            // *y = 0-temp;
                            ama= ry/100 + ((0-rx)/100*mapX);
                        }else{
                            ama= rx/100 + ((ry)/100*mapX);
                        }

                        // number(ama);
                        // printc('-');
                        // number(rx);
                        // printc('-');
                        // number(ry);
                        // newline();
                    
                        if (ama > 0 && ama < mapX*mapY){
                            if(map[ama] == 1){
                                if (oldY == 0){
                                        line(i*DMIR, yy*YMULT, i*DMIR, YMAX-(yy*YMULT));
                                    }
                                for (int d = 0; d < DMIR; ++d){
                                    setpix(i*DMIR+d, yy*YMULT);
                                    setpix(i*DMIR+d, YMAX-(yy*YMULT));
                                    
                                    toy = yy;
                                    
                                }
                                break;
                            }
                        }
                        
                        ry-=rayDirX/2;
                        rx+=rayDirY/2;

                        // line(rx/100*8, ry/100*8, orx/100*8, ory/100*8);

                           

                }
                if (toy  != oldY && toy != 0 && oldY != 0){
                    line((i)*DMIR, (min(oldY, toy)+1)*YMULT, (i)*DMIR, (max(oldY, toy)-1)*YMULT);
                    line((i)*DMIR, YMAX-(min(oldY, toy)+1)*YMULT, (i)*DMIR, YMAX-(max(oldY, toy)-1)*YMULT);
                }
                if (oldY != 0 && toy ==0){
                    line((i)*DMIR, (oldY+1)*YMULT, (i)*DMIR, YMAX-((oldY+1)*YMULT));
                }
                oldY=toy;
                
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
