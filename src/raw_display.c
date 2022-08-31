#pragma once

void set_lcd(char col, char row, char data){
    __asm

    ld  a, 4 (ix)
    add a, #0x20
     out (#0x10), a

    ex (sp),hl ;19
     ex (sp),hl ;38
     inc (hl)   ;49
     dec (hl)   ;60



     ld  a, 5 (ix)
     add a, #0x20
     ld a, #0x80
     out (#0x10), a


     ex (sp),hl ;19
     ex (sp),hl ;38
     inc (hl)   ;49
     dec (hl)   ;60

     ld a, 6 (ix)
     out (#0x11), a
    __endasm;
}
// void fast_fill(){
//     for (char  c = 0x20; c < 0x3F; ++c){
//         __asm
//              ld d, a

//              ld a, c
//              out (#0x10), a

//              ex (sp),hl ;19
//              ex (sp),hl ;38
//              inc (hl)   ;49
//              dec (hl)   ;60
//              ld a, d
//         __endasm;
//         for (char  r = 0x80; r < 0xBF; ++r){
//             __asm
//             ld d, a


//             ld a, #0xFF             
//              out (#0x11), a


//              ex (sp),hl ;19
//              ex (sp),hl ;38
//              inc (hl)   ;49
//              dec (hl)   ;60




//              ld a, d
//             __endasm;
//         }
//     }
// }

// void fast_clear(){
//     for (char  c = 0x20; c < 0x3F; ++c){
//         __asm
//              ld d, a

//              ld a, c
//              out (#0x10), a

//              ex (sp),hl ;19
//              ex (sp),hl ;38
//              inc (hl)   ;49
//              dec (hl)   ;60
//              ld a, d
//         __endasm;
//         for (char  r = 0x80; r < 0xBF; ++r){
//             __asm
//             ld d, a


//             ld a, #0x00             
//              out (#0x11), a
//              ld a, d
//             __endasm;
//         }
//     }
// }
void lwait(){
    __asm
    lcd_busy_loop:
        in a,(#0x10)
        rla
        jr c,lcd_busy_loop
    __endasm;
}
void fast_fill(){
    for (char  c = 0x20; c < 0x3F; ++c){
        for (char  r = 0x80; r < 0xBF; ++r){
            __asm
            ld d, a
             out (#0x10), a

            ex (sp),hl ;19
             ex (sp),hl ;38
             inc (hl)   ;49
             dec (hl)   ;60

             ld a, c
             out (#0x10), a

             __endasm;
             lwait();
             __asm


            ld a, #0xFF             
             out (#0x11), a
             ld a, d
            __endasm;
        }
    }
    __asm
    ld a, #0x00
    out (#0x11), a
    __endasm;
}
