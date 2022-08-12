

#include <stdbool.h>

struct Vec3* camPos;


#define PROJ_NO_ROT
#define MIN_MAX
#define USE_LINE
#define RENDER_NUMS
#define USE_PRINT_FUNCS

#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"

#include "../../src/crapmath.c"


#define VARBIN        0x9872
#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);


unsigned int Vtrack;

void safeline(slong x, slong y, slong x2, slong y2){
    x = max(x, 0);
    y = max(y, 0);
    x = min(x, XMAX);
    y = min(y, YMAX);

    x2 = max(x2, 0);
    y2 = max(y2, 0);
    x2 = min(x2, XMAX);
    y2 = min(y2, YMAX);
    line(x, y, x2, y2);
}
struct Vec2* output1;
struct Vec2* output2;
void d3line(slong x, slong y, slong z, slong x2, slong y2, slong z2){
    projectNoRot(x,  y,  z, output1);
    projectNoRot(x2, y2, z2, output2);
    if (output1->x != -69420 && output2->x != -69420)
        line(output1->x, output1->y,output2->x, output2->y);
    

}

void renderObj(int plen, int llen, int* points, int* lines){
    int *rms = (int*)Vtrack;
    int rc = 0;
    for (int i = 0; i < plen/3*2; i+=3){

        projectNoRot(points[i],  points[i+1],  points[i+2], output1);
        // number(output1->x);
        // printc('+');
        // number(output1->y);

        // newline();
        if (output1->x != -69420 && output2->x != -69420){
            rms[rc] = output1->x;
            rms[rc+1] = output1->y;
        }else{
            rms[rc] = 0;
            rms[rc+1] = 0;
        }
        rc+=2;
    }
    for (int i =0; i < llen; i+=2){
        int pi = lines[i]-1, pi2 = lines[i+1]-1;
        line(rms[pi*2], rms[pi*2+1], rms[pi2*2], rms[pi2*2+1]);
        // number(rms[pi*2]);
        // printc('+');
        // number(rms[pi*2+1]);
        // printc('-');
        // number(rms[pi*2]);
        // printc('+');
        // number(rms[pi*2+1]);
        // newline();
        // break;
    }
}
void main() {
    #include "rooms.c"
    init_graphics();
    clearscreen();
    badclr();
    #define END   5
    #define START 2
    Vtrack = VARBIN;

    memmk(cam, struct Vec3);
    cam->x= 0;
    cam->y = 0;
    cam->z = -10;
    camPos = cam;


    memmk(out1, struct Vec2);
    out1->x= 0;
    out1->y = 0;
    output1=out1;
    memmk(out2, struct Vec2);
    out2->x= 0;
    out2->y = 0;
    output2=out2;

    bool keyc = true;
    bool update = true;
    while (true){
        int x = getKeyId();
        

        if (x == 15)
            break;
        else if (x == 2 & keyc){
            update = true;
            cam->x-=1;
        }
        else if (x == 3){
            update = true;
            cam->x+=1;
        }
        else if (x == 1){
            update = true;
            cam->z-=1;
        }
        else if (x == 4){
            update = true;
            cam->z+=1;
        }
        else if (x == 0x0A){
            update = true;
            cam->y+=1;
        }
        else if (x==0x0B){
            cam->y-=1;
            update = true;
        }else{
            keyc=true;
        }

        if (update){

            update = false;
            badclr();
            renderObj(12, 16, points, lines);
            // for (int i = 0; i < 5; i++){
            //  d3line(-4, 4, i+2+camPos->z, 4, 4, i+2+camPos->z);
            //  d3line(-4, 4, i+2+camPos->z, -4, 4, i+3+camPos->z);
            //  d3line(4, 4, i+2+camPos->z, 4, 4, i+3+camPos->z);
            //  d3line(-4, -1, i+1, 4, -1, i+1);

            //  d3line(-4, 4, i+1, -4, -1, i+1);
            //  d3line(4, 4, i+1, 4, -1, i+1);   
            // }
            // d3line(10, 10, 10, 10, 10, 20);
            // d3line(10, 0, 10, 10, 0, 20);
            // d3line(10, 10, 10, 10, 0, 10);
            // d3line(10, 10, 20, 10, 0, 20);

            // d3line(50, 10, 10, 50, 10, 20);
            // d3line(50, 0, 10, 50, 0, 20);
            // d3line(50, 10, 10, 50, 0, 10);
            // d3line(50, 10, 20, 50, 0, 20);
            swap();
            // number(camPos->z);
            resetcursor();

        }
    }

	getKey();



}


