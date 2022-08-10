#pragma once

#include "crapmath.c"

#define XMAX 96
#define YMAX 64
#define IFMAX(x, y) (x>XMAX | y > YMAX | x<0 | y<0)
#define IFMAXBYTE(N) (N>768)
unsigned char* buff;





int pixpos(int x, int y){
    return (x/8) + (y*12);
}
// void setpixXOR(int x, int y ){
//     buff[pixpos(x, y)] ^= 1<<(7-(x%8));
// }
void setpix(int x, int y ){
    buff[pixpos(x, y)] |= 1<<(7-(x%8));
}
#ifdef V_H_LINES
void hline(int x, int y, int ln){
    int pp = y*12;
    for (int x2=x; x2 <x+ln; x2+=1){
        int temp = pp+(x2/8);
        if (!IFMAXBYTE(temp))
            buff[temp] |= 1<<(7-(x2%8));
    }
}
void vline(int x, int y, int ln){
    int pc = 1<<(7-(x%8));
    if (XMAX > x ){
        int xc = (x/8);
        for (int y2 = y; y2<y+ln; y2++){
            int temp = (y2*12)+xc;
            if (!IFMAXBYTE(temp))
                buff[temp] |= pc;   
        }
}}
#endif

#ifdef USE_LINE
void line(int x0, int y0, int x1, int y1) {
 
  int dx = absint(x1-x0), sx = x0<x1 ? 1 : -1;
  int dy = absint(y1-y0), sy = (y0<y1 ? 1 : -1)*12, sy1 = (y0<y1 ? 1 : -1); 
  int err = (dx>dy ? dx : -dy)/2, e2;
  int pp = pixpos(x0, y0);
  char pxor = 1<<(7-(x0%8));
  for(;;){
    if (x0 < XMAX && y0 < YMAX )
        buff[pp] |= pxor;
    if (x0==x1 && y0==y1) break;
    e2 = err;
    if (e2 >-dx) { err -= dy; 
        if (sx == 1){

            if (pxor != 1)
                pxor = pxor>>1;
            else{
                pp+=1;
                pxor=128;
            }
            x0+=1;
        }
        else{
            x0-=1;
            if (pxor != 128)
                pxor = pxor<<1;
            else{
                pp-=1;
                pxor=1;
            }
        }
    }
    if (e2 < dy) { err += dx; pp += sy;y0+=sy1; }
  }
}
#endif
void badclr(){
    for (int x = 0; x < 768; x+=1){
        buff[x] = 0;
    }
}
void badfill(){
    for (int x = 0; x < 768; x+=1){
        buff[x] = 0xFF;
    }
}
#ifdef RENDER_NUMS
void number(int x){
    int i = 0;
    if (x<0){
        x=0-x;
        printc('-');
    }
    char out[25];
    do {
        out[i]=x % 10 + '0';
        i+=1;
    } while((x /= 10) > 0);
    i--;
    for(;i>=0; i--){
        printc(out[i]);
    }

}
void numberslong(unsigned long x){
    int i = 0;

    char out[25];
    do {
        out[i]=x % 10 + '0';
        i+=1;
    } while((x /= 10) > 0);
    i--;
    for(;i>=0; i--){
        printc(out[i]);
    }

}
#endif

#ifdef WAIT_8
void wait(unsigned char x){ // Wait for amount of time (1/8th of sec)
    x;
    __asm
       di
       ld a,#0x47      ;8 hz
       out (#0x30),a
       ld a,#0x00        ; no loop, no interrupt
       out (#0x31),a
       ld a,4(ix)       ;16 ticks / 8 hz equals 2 seconds
       out (#0x32),a
    wait:
       in a,(4)
       bit 5,a       ;bit 5 tells if timer 1
       jr z,wait     ;is done
       xor a
       out (#0x30),a   ;Turn off the timer.
       out (#0x31),a
   __endasm;
}
#endif
#ifdef WAIT_128
void wait128(unsigned char x){ // Wait for amount of time (1/128th of sec)
    x;
    __asm
       di
       ld a,#0x46      ;128 hz
       out (#0x30),a
       ld a,#0x00        ; no loop, no interrupt
       out (#0x31),a
       ld a,4(ix)       
       out (#0x32),a
    wait2:
       in a,(4)
       bit 5,a       ;bit 5 tells if timer 1
       jr z,wait2     ;is done
       xor a
       out (#0x30),a   ;Turn off the timer.
       out (#0x31),a
   __endasm;
}
#endif

void swap(){
    bcall(0x486A);
    // bcall(0x4092);
    
}

int getKeyId(){
    bcall(0x4015);
    return (int)(*((char*)(0x843F)));}

#define SCREEN_BUFFER 0x9340
    


void init_graphics(){
    buff = (char*)(SCREEN_BUFFER);
}


#ifdef SCREEN_SAVE
void saveScreenToAppBackup(){
    char* appback = 0x9872;
    for (int i = 0; i < 768; i++){
        appback[i] = buff[i];
    }
}
void reviveScreenFromAppBackup(){
    char* appback = 0x9872;
    for (int i = 0; i < 768; i++){
        buff[i]= appback[i];
    }
}

#endif


#ifdef USE_GET_RANDOM
void resetRandomSeed(){
    bcall(0x4B7F);
}
int randomInt(){
    int x = 0;
    bcall(0x4B79);
    assignAToVar(&x);
    return x;
}

#endif

// void getTime(){
//     for (int i =0; i < 2; i++){ 
//         __asm
//         ld de,(#0x84AF)
//         push de
//             ld a,0x3F(iy)
//             push af
//                 set 4,0x3F(iy)
                
//                 __endasm;
//                     bcall(0x515E);
//                     print((char*)(0x84AF+1));
//                     printc('!');
//                     newline();
//                     // if (*((char*)(0x84AF+1)) == ':'){
//                     //     printc('!');
//                     // }
//                 __asm
//                 pop af
//             ld 0x3F(iy),a
//             pop hl
//         __endasm;
//     }

//     // printc('a')
//     // bcall(_vputs);
//     printc(';');

// }


/////////////////////   buff = (char*)(SCREEN_BUFFER);