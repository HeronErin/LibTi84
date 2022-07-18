#define XMAX 96
#define YMAX 64
#define IFMAX(x, y) (x>XMAX | y > YMAX | x<0 | y<0)
#define IFMAXBYTE(N) (N>768)
unsigned char* buff;




int pixpos(int x, int y){
    return (x/8) + (y*12);
}
void setpixXOR(int x, int y ){
    buff[pixpos(x, y)] ^= 1<<(7-(x%8));
}
void setpix(int x, int y ){
        buff[pixpos(x, y)] |= 1<<(7-(x%8));
}
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
void number(int x){
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


void swap(){bcall(0x486A);}

int getKeyId(){
    bcall(0x4015);
    int x = (int)(*((char*)(0x843F)));

    return x;}

#define SCREEN_BUFFER 0x9340
    


void init_graphics(){
    buff = (char*)(SCREEN_BUFFER);
}
/////////////////////   buff = (char*)(SCREEN_BUFFER);