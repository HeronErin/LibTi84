#pragma once



#define _LCD_BUSY_QUICK 0x000B

// get bottom bytes of realtime
#ifdef USE_GET_TIME
unsigned int getTime(){ 
    __asm
        in a, (0x45)
        ld l, a
        in a, (0x46)
        ld h, a
    __endasm;
}
#endif

// https://wikiti.brandonw.net/index.php?title=83Plus:Ports:20
// 0 for normal mode (8hz) 1 for turbo mode (16hz)
#ifdef USE_CPU_SPEED
char getCpuSpeed(){
    __asm
        in a, (0x20)
        ld l, a
    __endasm;
}
void setCpuSpeed(char speed){
    __asm
        ld a, 4 (ix)
        out (0x20), a
    __endasm;
}
#endif

/// CAREFULL THIS MY BREAK YOUR LCD
/// IM NOT 100% SURE ITS FULLY SAFE 
#ifdef USE_CUSTOM_LCD
void lcdCmode(char in){
    __asm
        CALL   _LCD_BUSY_QUICK   ; set row
        ld  a, 4 (ix)
        OUT    (0x10), a
    __endasm;
}
void lcd_write(char in){
    __asm
        CALL   _LCD_BUSY_QUICK

        ld  hl, #0 + 4
        add hl, sp
        ld  a, (hl)
        out (0x11), a

    __endasm;
}

void fcopy(){
    
    __asm
        CALL   _LCD_BUSY_QUICK  
        LD     A, #0x07           ; set y inc moce
        OUT    (0x10), A
    __endasm;
    int count = 0;
    for (char y = 0x80; y <= 0xBF; ++y){
        lcdCmode(y);
        lcdCmode(0x20);
        for (char x = 0; x < 12; ++x){
            char pb = buff[count]; 
            lcd_write(pb);
            count++;
            
        }
        
    }
}

void setLCD_FULL(char st){

    __asm
        CALL   _LCD_BUSY_QUICK  
        LD     A, #0x07           ; set y inc moce
        OUT    (0x10), A
    __endasm;
    for (char b = 0x80; b <= 0xBF; ++b){
        __asm
            ld d, a
            ;ld e, c
            CALL   _LCD_BUSY_QUICK   ; set row
            LD     A, C
            OUT    (0x10), A

            CALL   _LCD_BUSY_QUICK
            LD     A, #0x20          ; reset col
            OUT    (0x10), A
            ld a, d
            ;ld c, e
        __endasm;
        for (char i = 0; i < 12; ++i){
            __asm
                ld b, a

                CALL   _LCD_BUSY_QUICK
                ld a, 4(ix)
                out (0x11), a

                ld a, b
             
             
            __endasm;
        }
    }
}
#endif
