;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _getInfo
	.globl _nullcp
	.globl _drawBitmapStriped
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _wait
	.globl _numberslong
	.globl _number
	.globl _badfill
	.globl _badclr
	.globl _setpix
	.globl _pixpos
	.globl _printc
	.globl ___cio__current_line
	.globl _Vtrack
	.globl _buff
	.globl ___cio__buffer
	.globl ___cio__j
	.globl ___cio__i
	.globl ___cio__returnValue
	.globl _returnValue
	.globl ___clib__c
	.globl ___clib__returnval
	.globl ___clib__j
	.globl ___clib__i
	.globl _clearscreen
	.globl _resetcursor
	.globl _newline
	.globl _setPenCol
	.globl _setPenRow
	.globl _vputs
	.globl _vputc
	.globl _print
	.globl _println
	.globl _getKey
	.globl _assignAToVar
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
___clib__i::
	.ds 2
___clib__j::
	.ds 2
___clib__returnval::
	.ds 2
___clib__c::
	.ds 1
_returnValue::
	.ds 2
___cio__returnValue::
	.ds 2
___cio__i::
	.ds 2
___cio__j::
	.ds 2
___cio__buffer::
	.ds 16
_buff::
	.ds 2
_Vtrack::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
___cio__current_line::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;../../src/cio.c:4: void clearscreen(){
;	---------------------------------
; Function clearscreen
; ---------------------------------
_clearscreen::
;../../src/cio.c:5: bcall(_clrlcdf);
	rst	40 
	.dw #0x4540 
;../../src/cio.c:6: resetcursor();
;../../src/cio.c:7: }
	jp	_resetcursor
;../../src/cio.c:9: void resetcursor() {
;	---------------------------------
; Function resetcursor
; ---------------------------------
_resetcursor::
;../../src/cio.c:11: __cio__current_line = 0;
	ld	hl, #___cio__current_line
	ld	(hl), #0x00
;../../src/cio.c:12: setPenRow(0);
	xor	a, a
	push	af
	inc	sp
	call	_setPenRow
	inc	sp
;../../src/cio.c:13: setPenCol(0);
	xor	a, a
	push	af
	inc	sp
	call	_setPenCol
	inc	sp
;../../src/cio.c:14: }
	ret
;../../src/cio.c:16: void newline() {
;	---------------------------------
; Function newline
; ---------------------------------
_newline::
;../../src/cio.c:17: __cio__current_line += 6;
	ld	hl, #___cio__current_line
	ld	a, (hl)
	add	a, #0x06
	ld	(hl), a
;../../src/cio.c:18: setPenCol(0);
	xor	a, a
	push	af
	inc	sp
	call	_setPenCol
	inc	sp
;../../src/cio.c:19: }
	ret
;../../src/cio.c:21: void setPenCol(char col) {
;	---------------------------------
; Function setPenCol
; ---------------------------------
_setPenCol::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:26: __endasm;
	ld	a, 4(ix)
	ld	(#0x86D7), a
;../../src/cio.c:27: }
	pop	ix
	ret
;../../src/cio.c:29: void setPenRow(char row) {
;	---------------------------------
; Function setPenRow
; ---------------------------------
_setPenRow::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:34: __endasm;
	ld	a, 4(ix)
	ld	(#0x86D8), a
;../../src/cio.c:35: }
	pop	ix
	ret
;../../src/cio.c:37: void vputs(char* s) {
;	---------------------------------
; Function vputs
; ---------------------------------
_vputs::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:42: __endasm;
	ld	l, 4(ix)
	ld	h, 5(ix)
;../../src/cio.c:43: bcall(_vputs);
	rst	40 
	.dw #0x4561 
;../../src/cio.c:44: }
	pop	ix
	ret
;../../src/cio.c:46: void vputc(char c) {
;	---------------------------------
; Function vputc
; ---------------------------------
_vputc::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:51: __endasm;
	ld	a, 4(ix)
;../../src/cio.c:52: bcall(_vputmap);
	rst	40 
	.dw #0x455E 
;../../src/cio.c:53: }
	pop	ix
	ret
;../../src/cio.c:56: void printc(char c) {
;	---------------------------------
; Function printc
; ---------------------------------
_printc::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:57: setPenRow(__cio__current_line);
	ld	a, (#___cio__current_line)
	push	af
	inc	sp
	call	_setPenRow
	inc	sp
;../../src/cio.c:58: vputc(c);
	ld	a, 4 (ix)
	push	af
	inc	sp
	call	_vputc
	inc	sp
;../../src/cio.c:59: }
	pop	ix
	ret
;../../src/cio.c:61: void print(char* s) {
;	---------------------------------
; Function print
; ---------------------------------
_print::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:62: setPenRow(__cio__current_line);
	ld	a, (#___cio__current_line)
	push	af
	inc	sp
	call	_setPenRow
	inc	sp
;../../src/cio.c:64: vputs(s);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_vputs
	pop	af
;../../src/cio.c:65: }
	pop	ix
	ret
;../../src/cio.c:67: void println(char* s) {
;	---------------------------------
; Function println
; ---------------------------------
_println::
	push	ix
;../../src/cio.c:68: print(s);
	ld	hl, #0 + 4
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_print
	pop	af
;../../src/cio.c:69: newline();
;../../src/cio.c:70: }
	pop	ix
	jp	_newline
;../../src/cio.c:95: int getKey() {
;	---------------------------------
; Function getKey
; ---------------------------------
_getKey::
;../../src/cio.c:96: bcall(_getkey);
	rst	40 
	.dw #0x4972 
;../../src/cio.c:97: assignAToVar(&__cio__returnValue);
	ld	hl, #___cio__returnValue
	push	hl
	call	_assignAToVar
	pop	af
;../../src/cio.c:98: return __cio__returnValue;
	ld	hl, (___cio__returnValue)
;../../src/cio.c:99: }
	ret
;../../src/libti.c:6: void assignAToVar(int* var) {
;	---------------------------------
; Function assignAToVar
; ---------------------------------
_assignAToVar::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/libti.c:16: __endasm;
	ld	d,4 (ix)
	ld	e,5 (ix)
	ld	l, d
	ld	h, e
	ld	(hl),a
	inc	hl
	ld	(hl),#0x00
;../../src/libti.c:17: }
	pop	ix
	ret
;../../src/graphics.c:15: int pixpos(int x, int y){
;	---------------------------------
; Function pixpos
; ---------------------------------
_pixpos::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/graphics.c:16: return (x/8) + (y*12);
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	bit	7, d
	jr	Z, 00103$
	ld	hl, #0x0007
	add	hl, de
	ex	de, hl
00103$:
	ld	c, e
	ld	b, d
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	e, 6 (ix)
	ld	d, 7 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	l, c
	ld	h, b
	add	hl, de
;../../src/graphics.c:17: }
	pop	ix
	ret
;../../src/graphics.c:21: void setpix(int x, int y ){
;	---------------------------------
; Function setpix
; ---------------------------------
_setpix::
	push	ix
	ld	ix,#0
	add	ix,sp
	dec	sp
;../../src/graphics.c:22: buff[pixpos(x, y)] |= 1<<(7-(x%8));
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_pixpos
	pop	af
	pop	af
	ex	de, hl
	ld	hl, #_buff
	ld	a, (hl)
	add	a, e
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	b, a
	ld	a, (bc)
	ld	-1 (ix), a
	push	bc
	ld	hl, #0x0008
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de, hl
	pop	bc
	ld	a, #0x07
	sub	a, e
	ld	e, a
	ld	a, #0x01
	inc	e
	jr	00104$
00103$:
	add	a, a
00104$:
	dec	e
	jr	NZ,00103$
	or	a, -1 (ix)
	ld	(bc), a
;../../src/graphics.c:23: }
	inc	sp
	pop	ix
	ret
;../../src/graphics.c:83: void badclr(){
;	---------------------------------
; Function badclr
; ---------------------------------
_badclr::
;../../src/graphics.c:84: for (int x = 0; x < 768; x+=1){
	ld	bc, #0x0000
00103$:
	ld	a, b
	xor	a, #0x80
	sub	a, #0x83
	ret	NC
;../../src/graphics.c:85: buff[x] = 0;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	xor	a, a
	ld	(de), a
;../../src/graphics.c:84: for (int x = 0; x < 768; x+=1){
	inc	bc
;../../src/graphics.c:87: }
	jr	00103$
;../../src/graphics.c:88: void badfill(){
;	---------------------------------
; Function badfill
; ---------------------------------
_badfill::
;../../src/graphics.c:89: for (int x = 0; x < 768; x+=1){
	ld	bc, #0x0000
00103$:
	ld	a, b
	xor	a, #0x80
	sub	a, #0x83
	ret	NC
;../../src/graphics.c:90: buff[x] = 0xFF;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	ld	a, #0xff
	ld	(de), a
;../../src/graphics.c:89: for (int x = 0; x < 768; x+=1){
	inc	bc
;../../src/graphics.c:92: }
	jr	00103$
;../../src/graphics.c:94: void number(int x){
;	---------------------------------
; Function number
; ---------------------------------
_number::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-29
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:96: if (x<0){
	bit	7, 5 (ix)
	jr	Z, 00113$
;../../src/graphics.c:97: x=0-x;
	xor	a, a
	sub	a, 4 (ix)
	ld	4 (ix), a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	5 (ix), a
;../../src/graphics.c:98: printc('-');
	ld	a, #0x2d
	push	af
	inc	sp
	call	_printc
	inc	sp
;../../src/graphics.c:101: do {
00113$:
	ld	hl, #0
	add	hl, sp
	ld	-4 (ix), l
	ld	-3 (ix), h
	ld	bc, #0x0000
00103$:
;../../src/graphics.c:102: out[i]=x % 10 + '0';
	ld	a, -4 (ix)
	add	a, c
	ld	e, a
	ld	a, -3 (ix)
	adc	a, b
	ld	d, a
	push	bc
	push	de
	ld	hl, #0x000a
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
	ld	a, -2 (ix)
	add	a, #0x30
	ld	(de), a
;../../src/graphics.c:103: i+=1;
	inc	bc
;../../src/graphics.c:104: } while((x /= 10) > 0);
	push	bc
	ld	hl, #0x000a
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ex	de, hl
	pop	bc
	ld	4 (ix), e
	ld	5 (ix), d
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00139$
	xor	a, #0x80
00139$:
	jp	M, 00103$
;../../src/graphics.c:105: i--;
	dec	bc
00108$:
;../../src/graphics.c:106: for(;i>=0; i--){
	bit	7, b
	jr	NZ, 00110$
;../../src/graphics.c:107: printc(out[i]);
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_printc
	inc	sp
	pop	bc
;../../src/graphics.c:106: for(;i>=0; i--){
	dec	bc
	jr	00108$
00110$:
;../../src/graphics.c:110: }
	ld	sp, ix
	pop	ix
	ret
;../../src/graphics.c:111: void numberslong(unsigned long x){
;	---------------------------------
; Function numberslong
; ---------------------------------
_numberslong::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-31
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:115: do {
	ld	hl, #0
	add	hl, sp
	ld	-6 (ix), l
	ld	-5 (ix), h
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00101$:
;../../src/graphics.c:116: out[i]=x % 10 + '0';
	ld	a, -6 (ix)
	add	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -5 (ix)
	adc	a, -1 (ix)
	ld	-3 (ix), a
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x000a
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modulong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	a, l
	add	a, #0x30
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	ld	(hl), a
;../../src/graphics.c:117: i+=1;
	inc	-2 (ix)
	jr	NZ, 00132$
	inc	-1 (ix)
00132$:
;../../src/graphics.c:118: } while((x /= 10) > 0);
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x000a
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__divulong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	4 (ix), c
	ld	5 (ix), b
	ld	6 (ix), e
	ld	7 (ix), d
	ld	a, d
	or	a, e
	or	a, b
	or	a, c
	jr	NZ, 00101$
;../../src/graphics.c:119: i--;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	dec	bc
00106$:
;../../src/graphics.c:120: for(;i>=0; i--){
	bit	7, b
	jr	NZ, 00108$
;../../src/graphics.c:121: printc(out[i]);
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_printc
	inc	sp
	pop	bc
;../../src/graphics.c:120: for(;i>=0; i--){
	dec	bc
	jr	00106$
00108$:
;../../src/graphics.c:124: }
	ld	sp, ix
	pop	ix
	ret
;../../src/graphics.c:128: void wait(unsigned char x){ // Wait for amount of time (1/8th of sec)
;	---------------------------------
; Function wait
; ---------------------------------
_wait::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/graphics.c:145: __endasm;
	di
	ld	a,#0x47 ;8 hz
	out	(#0x30),a
	ld	a,#0x00 ; no loop, no interrupt
	out	(#0x31),a
	ld	a,4(ix) ;16 ticks / 8 hz equals 2 seconds
	out	(#0x32),a
	    wait:
	in	a,(4)
	bit	5,a ;bit 5 tells if timer 1
	jr	z,wait ;is done
	xor	a
	out	(#0x30),a ;Turn off the timer.
	out	(#0x31),a
;../../src/graphics.c:146: }
	pop	ix
	ret
;../../src/graphics.c:171: void swap(){
;	---------------------------------
; Function swap
; ---------------------------------
_swap::
;../../src/graphics.c:172: bcall(0x486A);
	rst	40 
	.dw 0x486A 
;../../src/graphics.c:239: }
	ret
;../../src/graphics.c:241: int getKeyId(){
;	---------------------------------
; Function getKeyId
; ---------------------------------
_getKeyId::
;../../src/graphics.c:242: bcall(0x4015);
	rst	40 
	.dw 0x4015 
;../../src/graphics.c:243: return (int)(*((char*)(0x843F)));}
	ld	hl, #0x843f
	ld	l, (hl)
	ld	h, #0x00
	ret
;../../src/graphics.c:249: void init_graphics(){
;	---------------------------------
; Function init_graphics
; ---------------------------------
_init_graphics::
;../../src/graphics.c:250: buff = (char*)(SCREEN_BUFFER);
	ld	hl, #_buff
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x93
;../../src/graphics.c:251: }
	ret
;../../src/graphics.c:321: void drawBitmapStriped(int x, int y, int width, int height, char* img){
;	---------------------------------
; Function drawBitmapStriped
; ---------------------------------
_drawBitmapStriped::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-15
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:322: int addMax=0;
	ld	hl, #0x0000
	ex	(sp), hl
;../../src/graphics.c:324: int xdiv = x/8;
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	bit	7, d
	jr	Z, 00117$
	ld	hl, #0x0007
	add	hl, de
	ex	de, hl
00117$:
	ld	-13 (ix), e
	ld	-12 (ix), d
	sra	-12 (ix)
	rr	-13 (ix)
	sra	-12 (ix)
	rr	-13 (ix)
	sra	-12 (ix)
	rr	-13 (ix)
;../../src/graphics.c:325: for (int py =0; py<height; ++py){
	xor	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
00113$:
	ld	a, -6 (ix)
	sub	a, 10 (ix)
	ld	a, -5 (ix)
	sbc	a, 11 (ix)
	jp	PO, 00158$
	xor	a, #0x80
00158$:
	jp	P, 00115$
;../../src/graphics.c:326: int yadd = (py+y);
	ld	a, -6 (ix)
	add	a, 6 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, 7 (ix)
	ld	-1 (ix), a
;../../src/graphics.c:327: int tempY = (yadd*12);
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-11 (ix), l
	ld	-10 (ix), h
;../../src/graphics.c:329: int pw = py*width;
	ld	l, 8 (ix)
	ld	h, 9 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	call	__mulint
	pop	af
	pop	af
	ex	de, hl
	ld	-9 (ix), e
	ld	-8 (ix), d
;../../src/graphics.c:330: for (int px = 0; px<width; ++px){
	ld	a, -2 (ix)
	sub	a, #0x40
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	ld	a, #0x00
	rla
	ld	-7 (ix), a
	ld	a, -15 (ix)
	ld	-4 (ix), a
	ld	a, -14 (ix)
	ld	-3 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00110$:
	ld	a, -2 (ix)
	sub	a, 8 (ix)
	ld	a, -1 (ix)
	sbc	a, 9 (ix)
	jp	PO, 00159$
	xor	a, #0x80
00159$:
	jp	P, 00114$
;../../src/graphics.c:331: if(yadd<YMAX){
	ld	a, -7 (ix)
	or	a, a
	jr	Z, 00104$
;../../src/graphics.c:332: char pixbyte = img[px+( pw )];
	ld	a, -2 (ix)
	add	a, -9 (ix)
	ld	c, a
	ld	a, -1 (ix)
	adc	a, -8 (ix)
	ld	b, a
	ld	a, c
	add	a, 12 (ix)
	ld	c, a
	ld	a, b
	adc	a, 13 (ix)
	ld	l, c
	ld	h, a
	ld	c, (hl)
;../../src/graphics.c:334: int pxb = px+(xdiv);
	ld	a, -2 (ix)
	add	a, -13 (ix)
	ld	e, a
	ld	a, -1 (ix)
	adc	a, -12 (ix)
	ld	b, a
;../../src/graphics.c:335: if (pxb<12)
	ld	a, e
	sub	a, #0x0c
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00104$
;../../src/graphics.c:336: buff[tempY+pxb] = pixbyte;
	ld	a, e
	add	a, -11 (ix)
	ld	e, a
	ld	a, b
	adc	a, -10 (ix)
	ld	b, a
	ld	hl, #_buff
	ld	a, (hl)
	add	a, e
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	ld	a, c
	ld	(de), a
00104$:
;../../src/graphics.c:339: if (addMax > 700)
	ld	a, #0xbc
	cp	a, -4 (ix)
	ld	a, #0x02
	sbc	a, -3 (ix)
	jp	PO, 00160$
	xor	a, #0x80
00160$:
	jp	P, 00106$
;../../src/graphics.c:340: return;
	jr	00115$
00106$:
;../../src/graphics.c:341: ++addMax;
	inc	-4 (ix)
	jr	NZ, 00161$
	inc	-3 (ix)
00161$:
	ld	a, -4 (ix)
	ld	-15 (ix), a
	ld	a, -3 (ix)
	ld	-14 (ix), a
;../../src/graphics.c:330: for (int px = 0; px<width; ++px){
	inc	-2 (ix)
	jp	NZ,00110$
	inc	-1 (ix)
	jp	00110$
00114$:
;../../src/graphics.c:325: for (int py =0; py<height; ++py){
	inc	-6 (ix)
	jp	NZ,00113$
	inc	-5 (ix)
	jp	00113$
00115$:
;../../src/graphics.c:345: }
	ld	sp, ix
	pop	ix
	ret
;../../src/assetManager.c:5: void nullcp(char* to, char* from){
;	---------------------------------
; Function nullcp
; ---------------------------------
_nullcp::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;../../src/assetManager.c:6: to[0] = '\x15';
	ld	a, 4 (ix)
	ld	-4 (ix), a
	ld	a, 5 (ix)
	ld	-3 (ix), a
	pop	hl
	push	hl
	ld	(hl), #0x15
;../../src/assetManager.c:7: for (int i =1; i < 10; ++i){
	ld	bc, #0x0001
00105$:
	ld	a, c
	sub	a, #0x0a
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00107$
;../../src/assetManager.c:8: to[i] = from[i-1];
	ld	a, -4 (ix)
	add	a, c
	ld	-2 (ix), a
	ld	a, -3 (ix)
	adc	a, b
	ld	-1 (ix), a
	ld	e, c
	ld	d, b
	dec	de
	ld	a, e
	add	a, 6 (ix)
	ld	e, a
	ld	a, d
	adc	a, 7 (ix)
	ld	d, a
	ld	a, (de)
	pop	de
	pop	hl
	push	hl
	push	de
	ld	(hl), a
;../../src/assetManager.c:9: if (from[i] == 0)
	ld	a, 6 (ix)
	add	a, c
	ld	e, a
	ld	a, 7 (ix)
	adc	a, b
	ld	d, a
	ld	a, (de)
	or	a, a
	jr	Z, 00107$
;../../src/assetManager.c:7: for (int i =1; i < 10; ++i){
	inc	bc
	jr	00105$
00107$:
;../../src/assetManager.c:12: }
	ld	sp, ix
	pop	ix
	ret
;../../src/assetManager.c:15: int getInfo(char* name){
;	---------------------------------
; Function getInfo
; ---------------------------------
_getInfo::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/assetManager.c:20: __endasm;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
;../../src/assetManager.c:23: bcall(0x4206);
	rst	40 
	.dw 0x4206 
;../../src/assetManager.c:24: bcall(0x42F1);
	rst	40 
	.dw 0x42F1 
;../../src/assetManager.c:37: __endasm;
	jr	c,notfound
	ld	h, e
	ld	l, d
	jr	nc,eoff
	    notfound:
	ld	l, #0x00
	ld	h, #0x00
	 eoff:
;../../src/assetManager.c:39: }
	pop	ix
	ret
;main.c:37: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:38: init_graphics();
	call	_init_graphics
;main.c:40: char* loc = getInfo("\x15notes\0\0");
	ld	hl, #___str_0
	push	hl
	call	_getInfo
;main.c:43: clearscreen();
	ex	(sp),hl
	call	_clearscreen
	pop	de
;main.c:44: number(loc[0]);newline();
	ld	a, (de)
	ld	c, a
	ld	b, #0x00
	push	de
	push	bc
	call	_number
	pop	af
	call	_newline
	pop	de
;main.c:45: number(loc[1]);newline();
	ld	l, e
	ld	h, d
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	push	de
	push	bc
	call	_number
	pop	af
	call	_newline
	pop	de
;main.c:46: number(loc[2]);newline();
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	push	de
	push	bc
	call	_number
	pop	af
	call	_newline
	pop	de
;main.c:47: number(loc[3]);newline();
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	c, (hl)
	ld	b, #0x00
	push	de
	push	bc
	call	_number
	pop	af
	call	_newline
	call	_newline
	call	_number
	pop	af
;main.c:53: getKey();
;main.c:54: }
	jp	_getKey
___str_0:
	.db 0x15
	.ascii "notes"
	.db 0x00
	.db 0x00
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
