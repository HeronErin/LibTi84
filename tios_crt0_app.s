
   .module crt
   .globl _main
   .area _HEADER (ABS)

.org 0x4000

   ; Master Field
   .db   0x80, 0x0F, 0, 0, 0, 0
   ; Name
   .db   0x80, 0x48
   .ascii "rop     "
   ; Disable TI splash screen.
   .db   0x80, 0x90
   ; Pages
   .db   0x80, 0x81, 1
   ; Signing Key ID
   .db   0x80, 0x12, 1, 4
   ; Date stamp.  Nothing ever checks this, so you can put nothing in it.
   .db   0x03, 0x22, 0x09, 0x00
   ; Date stamp signature.  Since nothing ever checks this, there's no
   ; reason ever to update it.  Or even have data in it.
   .db   0x02, 00
   ; Final field
   .db   0x80, 0x70



   rst 0x28 ; bcall(_ForceFullScreen)
   .dw 0x508F
   rst 0x28 ; bcall(_ClrLCDFull)
   .dw 0x4540

   
   call gsinit
   jp _main

   .area _HOME
   .area _CODE
   .area _GSINIT
   .area _GSFINAL
   .area _DATA
   .area _BSEG
   .area _BSS
   .area _HEAP
   .area _CODE
   

   ;; Twice ???


__clock::
   ld a,#2
   ret ; needed somewhere...
   .area _GSINIT
gsinit::
   .area _GSFINAL

   ret

