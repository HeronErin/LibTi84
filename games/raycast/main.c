#include <stdbool.h>




#define TANS_PRE
#define COS_PRE
#define SIN_PRE


#include "../../src/setting.h"
#include "../../src/libti.c"

#include "../../src/graphics.c"




#define VARBIN        0x9872







#define memmk(name, type)  type* name = (type*)(Vtrack); Vtrack+=sizeof(type);


int FixAng(int a){
    if(a>359) 
        a-=360;
    if(a<0)
        a+=360;
    return a;
}
unsigned int Vtrack;


#define DMIR 6
#define YMULT 1

#define mapX  8      //map width
#define mapY  8      //map height
#define mapS 64      //map cube size
char* map;

float px, py, pa;
float pdx, pdy;

// void ray(){
//     int r,mx,my,mp,dof,side; float vx,vy,rx,ry,ra,xo,yo,disV,disH; 

//     ra=FixAng(pa+30);
//     for(r=0;r<60;r++)
//      {
//       //---Vertical--- 
//       dof=0; side=0; disV=100000;
//       float Tan=((float)getTan(pa))/100;
//       float Cos=((float)getCos(pa))/100;
//       float Sin=((float)getSin(pa))/100;

//        if(Cos> 0.001){ rx=(((int)px>>6)<<6)+64;      ry=(px-rx)*Tan+py; xo= 64; yo=-xo*Tan;}//looking left
//       else if(Cos<-0.001){ rx=(((int)px>>6)<<6) -0.0001; ry=(px-rx)*Tan+py; xo=-64; yo=-xo*Tan;}//looking right
//       else { rx=px; ry=py; dof=8;}                                                  //looking up or down. no hit  

//       while(dof<8) 
//       { 
//        mx=(int)(rx)>>6; my=(int)(ry)>>6; mp=my*mapX+mx;                     
//        if(mp>0 && mp<mapX*mapY && map[mp]==1){ dof=8; disV=Cos*(rx-px)-Sin*(ry-py);}//hit         
//        else{ rx+=xo; ry+=yo; dof+=1;}                                               //check next horizontal
//       } 
//       vx=rx; vy=ry;

//       //---Horizontal---
//       dof=0; disH=100000;
//       Tan=1.0/Tan; 
//            if(Sin> 0.001){ ry=(((int)py>>6)<<6) -0.0001; rx=(py-ry)*Tan+px; yo=-64; xo=-yo*Tan;}//looking up 
//       else if(Sin<-0.001){ ry=(((int)py>>6)<<6)+64;      rx=(py-ry)*Tan+px; yo= 64; xo=-yo*Tan;}//looking down
//       else{ rx=px; ry=py; dof=8;}                                                   //looking straight left or right
     
//       while(dof<8) 
//       { 
//        mx=(int)(rx)>>6; my=(int)(ry)>>6; mp=my*mapX+mx;                          
//        if(mp>0 && mp<mapX*mapY && map[mp]==1){ dof=8; disH=Cos*(rx-px)-Sin*(ry-py);}//hit         
//        else{ rx+=xo; ry+=yo; dof+=1;}                                               //check next horizontal
//       } 
      
//       // glColor3f(0,0.8,0);
//       // if(disV<disH){ rx=vx; ry=vy; disH=disV; glColor3f(0,0.6,0);}                  //horizontal hit first
//       // glLineWidth(2); glBegin(GL_LINES); glVertex2i(px,py); glVertex2i(rx,ry); glEnd();//draw 2D ray
        
//       // int ca=FixAng(pa-ra); disH=disH*cos(degToRad(ca));                            //fix fisheye 
//       // int lineH = (mapS*320)/(disH); if(lineH>320){ lineH=320;}                     //line height and limit
//       // int lineOff = 160 - (lineH>>1);                                               //line offset
      
//       // glLineWidth(8);glBegin(GL_LINES);glVertex2i(r*8+530,lineOff);glVertex2i(r*8+530,lineOff+lineH);glEnd();//draw vertical wall  

//       ra=FixAng(ra-1);                                                              //go to next ray
//      }
// }

char mapp[]=           //the map array. Edit to change level but keep the outer walls
{
    1,1,1,1,1,1,1,1,
    1,0,1,0,0,0,0,1,
    1,0,1,0,0,0,0,1,
    1,0,1,0,0,0,0,1,
    1,0,0,0,0,0,0,1,
    1,0,0,0,0,1,0,1,
    1,0,0,0,0,0,0,1,
    1,1,1,1,1,1,1,1,   
};
float fltA(int ang){
    return ((float)ang)/100;
}
void main() {
     px=150; py=400; pa=100;
     pdx=fltA(getCos(pa)); pdy=-fltA(getSin(pa)); 

    __asm
        ld  hl, #_map
        ld  (hl), #<(__xinit__mapp)
        inc hl
        ld  (hl), #>(__xinit__mapp)
    __endasm;


    clearscreen();
    resetcursor();
    init_graphics();

    getKey();


}
