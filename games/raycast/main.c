

#include <stdbool.h>


#define TANS_PRE
#define COS_PRE
#define SIN_PRE

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

int FixAng(int a){ if(a>359){ a-=360;} if(a<0){ a+=360;} return a;}


int px, py, pa; float pdx, pdy;

void main() {
    int px = 3;
    int py = 5;
    int rot = 0;

     px=150; py=400; pa=90;
     pdx=((float)getCos(pa))/100; pdy= ( (float) (-getSin(pa)))/100; 

    char map[] = {
        1, 1, 1, 1, 1, 1,
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1, 
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1,
        1, 0, 0, 0, 0, 1,
        1, 1, 1, 1, 1, 1
    };


    int r,mx,my,mp,dof,side; float vx,vy,rx,ry,ra,xo,yo,disV,disH; 

    clearscreen();
    init_graphics();
    badclr();

    ra=FixAng(pa+30);   

 for(r=0;r<60;r++)
 {
  //---Vertical--- 
  dof=0; side=0; disV=100000;
  float Tan=getTan(ra);
       if( getCos(ra) > 0.001){ rx=(((int)px>>6)<<6)+64;      ry=(px-rx)*Tan+py; xo= 64; yo=-xo*Tan;}//looking left
  else if( getCos(ra) <-0.001){ rx=(((int)px>>6)<<6) -0.0001; ry=(px-rx)*Tan+py; xo=-64; yo=-xo*Tan;}//looking right
  else { rx=px; ry=py; dof=8;}                                                  //looking up or down. no hit  

  while(dof<8) 
  { 
   mx=(int)(rx)>>6; my=(int)(ry)>>6; mp=my*mapX+mx;                     
   if(mp>0 && mp<mapX*mapY && map[mp]==1){ dof=8; disV=getCos(ra)*(rx-px)-getSin(ra)*(ry-py);}//hit         
   else{ rx+=xo; ry+=yo; dof+=1;}                                               //check next horizontal
  } 
  vx=rx; vy=ry;

  //---Horizontal---
  dof=0; disH=100000;
  Tan=1.0/Tan; 
       if(getSin(ra)> 0.001){ ry=(((int)py>>6)<<6) -0.0001; rx=(py-ry)*Tan+px; yo=-64; xo=-yo*Tan;}//looking up 
  else if(getSin(ra)<-0.001){ ry=(((int)py>>6)<<6)+64;      rx=(py-ry)*Tan+px; yo= 64; xo=-yo*Tan;}//looking down
  else{ rx=px; ry=py; dof=8;}                                                   //looking straight left or right
 
  while(dof<8) 
  { 
   mx=(int)(rx)>>6; my=(int)(ry)>>6; mp=my*mapX+mx;                          
   if(mp>0 && mp<mapX*mapY && map[mp]==1){ dof=8; disH=getCos(ra)*(rx-px)-getSin(ra)*(ry-py);}//hit         
   else{ rx+=xo; ry+=yo; dof+=1;}                                               //check next horizontal
  } 

      
  // glColor3f(0,0.8,0);
  if(disV<disH){ rx=vx; ry=vy; disH=disV;}                  //horizontal hit first
  // glLineWidth(2); glBegin(GL_LINES); glVertex2i(px,py); glVertex2i(rx,ry); glEnd();//draw 2D ray
    
  int ca=FixAng(pa-ra); disH=disH*getCos(ca);                            //fix fisheye 
  int lineH = ((mapX*mapY)*320)/(disH); if(lineH>320){ lineH=320;}                     //line height and limit
  int lineOff = 160 - (lineH>>1);                                               //line offset
  
  // glLineWidth(8);glBegin(GL_LINES);glVertex2i(r*8+530,lineOff);glVertex2i(r*8+530,lineOff+lineH);glEnd();//draw vertical wall  

  ra=FixAng(ra-1);                                                              //go to next ray
 }










    swap();
    

    getKey();



}
