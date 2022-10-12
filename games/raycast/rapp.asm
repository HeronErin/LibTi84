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
	.globl _setLCD_FULL
	.globl _fcopy
	.globl _lcd_write
	.globl _lcdCmode
	.globl _setCpuSpeed
	.globl _getCpuSpeed
	.globl _getTime
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _badfill
	.globl _badclr
	.globl _line
	.globl _setpix
	.globl _pixpos
	.globl _absint
	.globl ___cio__current_line
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
;../../src/crapmath.c:120: int absint(int x){
;	---------------------------------
; Function absint
; ---------------------------------
_absint::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:121: if (x<0){
	bit	7, 5 (ix)
	jr	Z, 00102$
;../../src/crapmath.c:122: return 0-x;
	xor	a, a
	sub	a, 4 (ix)
	ld	e, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	d, a
	ex	de, hl
	jr	00103$
00102$:
;../../src/crapmath.c:124: return x;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
00103$:
;../../src/crapmath.c:125: }
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
;../../src/graphics.c:46: void line(int x0, int y0, int x1, int y1) {
;	---------------------------------
; Function line
; ---------------------------------
_line::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-14
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:48: int dx = absint(x1-x0), sx = x0<x1 ? 1 : -1;
	ld	a, 8 (ix)
	sub	a, 4 (ix)
	ld	c, a
	ld	a, 9 (ix)
	sbc	a, 5 (ix)
	ld	b, a
	push	bc
	call	_absint
	pop	af
	ex	de, hl
	inc	sp
	inc	sp
	push	de
	ld	a, 4 (ix)
	sub	a, 8 (ix)
	ld	a, 5 (ix)
	sbc	a, 9 (ix)
	jp	PO, 00204$
	xor	a, #0x80
00204$:
	jp	P, 00125$
	ld	bc, #0x0001
	jr	00126$
00125$:
	ld	bc, #0xffff
00126$:
	ld	-7 (ix), c
	ld	-6 (ix), b
;../../src/graphics.c:49: int dy = absint(y1-y0), sy = (y0<y1 ? 1 : -1)*12, sy1 = (y0<y1 ? 1 : -1); 
	ld	a, 10 (ix)
	sub	a, 6 (ix)
	ld	c, a
	ld	a, 11 (ix)
	sbc	a, 7 (ix)
	ld	b, a
	push	bc
	call	_absint
	pop	af
	ex	de, hl
	ld	a, 6 (ix)
	sub	a, 10 (ix)
	ld	a, 7 (ix)
	sbc	a, 11 (ix)
	jp	PO, 00205$
	xor	a, #0x80
00205$:
	rlca
	and	a,#0x01
	ld	c, a
	or	a, a
	jr	Z, 00127$
	ld	hl, #0x0001
	jr	00128$
00127$:
	ld	hl, #0xffff
00128$:
	push	de
	ld	e, l
	ld	d, h
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	pop	de
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	a, c
	or	a, a
	jr	Z, 00129$
	ld	bc, #0x0001
	jr	00130$
00129$:
	ld	bc, #0xffff
00130$:
	ld	-10 (ix), c
	ld	-9 (ix), b
;../../src/graphics.c:50: int err = (dx>dy ? dx : -dy)/2, e2;
	ld	a, e
	sub	a, -14 (ix)
	ld	a, d
	sbc	a, -13 (ix)
	jp	PO, 00206$
	xor	a, #0x80
00206$:
	jp	P, 00131$
	pop	hl
	push	hl
	jr	00132$
00131$:
	ld	hl, #0x0000
	cp	a, a
	sbc	hl, de
00132$:
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00133$
	inc	hl
	ld	c, l
	ld	b, h
00133$:
	ld	-5 (ix), c
	ld	-4 (ix), b
	sra	-4 (ix)
	rr	-5 (ix)
;../../src/graphics.c:51: int pp = pixpos(x0, y0);
	push	de
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_pixpos
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	de
	ld	-3 (ix), c
	ld	-2 (ix), b
;../../src/graphics.c:52: char pxor = 1<<(7-(x0%8));
	push	de
	ld	hl, #0x0008
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	pop	de
	ld	a, #0x07
	sub	a, c
	ld	-1 (ix), #0x01
	inc	a
	jr	00208$
00207$:
	sla	-1 (ix)
00208$:
	dec	a
	jr	NZ,00207$
	ld	a, -7 (ix)
	dec	a
	or	a, -6 (ix)
	ld	a, #0x01
	jr	Z, 00210$
	xor	a, a
00210$:
	ld	-8 (ix), a
	xor	a, a
	sub	a, -14 (ix)
	ld	-7 (ix), a
	ld	a, #0x00
	sbc	a, -13 (ix)
	ld	-6 (ix), a
00121$:
;../../src/graphics.c:54: if (x0 < XMAX && y0 < YMAX )
	ld	a, 4 (ix)
	sub	a, #0x60
	ld	a, 5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00102$
	ld	a, 6 (ix)
	sub	a, #0x40
	ld	a, 7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00102$
;../../src/graphics.c:55: buff[pp] |= pxor;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, -3 (ix)
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, -2 (ix)
	ld	b, a
	ld	a, (bc)
	or	a, -1 (ix)
	ld	(bc), a
00102$:
;../../src/graphics.c:56: if (x0==x1 && y0==y1) break;
	ld	a, 4 (ix)
	sub	a, 8 (ix)
	jr	NZ, 00105$
	ld	a, 5 (ix)
	sub	a, 9 (ix)
	jr	NZ, 00105$
	ld	a, 6 (ix)
	sub	a, 10 (ix)
	jr	NZ, 00213$
	ld	a, 7 (ix)
	sub	a, 11 (ix)
	jp	Z,00123$
00213$:
00105$:
;../../src/graphics.c:57: e2 = err;
	ld	c, -5 (ix)
	ld	b, -4 (ix)
;../../src/graphics.c:58: if (e2 >-dx) { err -= dy; 
	ld	a, -7 (ix)
	sub	a, -5 (ix)
	ld	a, -6 (ix)
	sbc	a, -4 (ix)
	jp	PO, 00214$
	xor	a, #0x80
00214$:
	jp	P, 00117$
	ld	a, -5 (ix)
	sub	a, e
	ld	-5 (ix), a
	ld	a, -4 (ix)
	sbc	a, d
	ld	-4 (ix), a
;../../src/graphics.c:59: if (sx == 1){
	ld	a, -8 (ix)
	or	a, a
	jr	Z, 00114$
;../../src/graphics.c:61: if (pxor != 1)
	ld	a, -1 (ix)
	dec	a
	jr	Z, 00108$
;../../src/graphics.c:62: pxor = pxor>>1;
	srl	-1 (ix)
	jr	00109$
00108$:
;../../src/graphics.c:64: pp+=1;
	inc	-3 (ix)
	jr	NZ, 00216$
	inc	-2 (ix)
00216$:
;../../src/graphics.c:65: pxor=128;
	ld	-1 (ix), #0x80
00109$:
;../../src/graphics.c:67: x0+=1;
	inc	4 (ix)
	jr	NZ, 00117$
	inc	5 (ix)
	jr	00117$
00114$:
;../../src/graphics.c:70: x0-=1;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	dec	hl
	ld	4 (ix), l
	ld	5 (ix), h
;../../src/graphics.c:71: if (pxor != 128)
	ld	a, -1 (ix)
	sub	a, #0x80
	jr	Z, 00111$
;../../src/graphics.c:72: pxor = pxor<<1;
	ld	a, -1 (ix)
	add	a, a
	ld	-1 (ix), a
	jr	00117$
00111$:
;../../src/graphics.c:74: pp-=1;
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	dec	hl
	ld	-3 (ix), l
	ld	-2 (ix), h
;../../src/graphics.c:75: pxor=1;
	ld	-1 (ix), #0x01
00117$:
;../../src/graphics.c:79: if (e2 < dy) { err += dx; pp += sy;y0+=sy1; }
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jp	PO, 00219$
	xor	a, #0x80
00219$:
	jp	P, 00121$
	ld	a, -5 (ix)
	add	a, -14 (ix)
	ld	-5 (ix), a
	ld	a, -4 (ix)
	adc	a, -13 (ix)
	ld	-4 (ix), a
	ld	a, -3 (ix)
	add	a, -12 (ix)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	adc	a, -11 (ix)
	ld	-2 (ix), a
	ld	a, 6 (ix)
	add	a, -10 (ix)
	ld	6 (ix), a
	ld	a, 7 (ix)
	adc	a, -9 (ix)
	ld	7 (ix), a
	jp	00121$
00123$:
;../../src/graphics.c:81: }
	ld	sp, ix
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
;../../src/portMagic.c:5: unsigned int getTime(){ 
;	---------------------------------
; Function getTime
; ---------------------------------
_getTime::
;../../src/portMagic.c:11: __endasm;
	in	a, (0x45)
	ld	l, a
	in	a, (0x46)
	ld	h, a
;../../src/portMagic.c:12: }
	ret
;../../src/portMagic.c:16: char getCpuSpeed(){
;	---------------------------------
; Function getCpuSpeed
; ---------------------------------
_getCpuSpeed::
;../../src/portMagic.c:20: __endasm;
	in	a, (0x20)
	ld	l, a
;../../src/portMagic.c:21: }
	ret
;../../src/portMagic.c:22: void setCpuSpeed(char speed){
;	---------------------------------
; Function setCpuSpeed
; ---------------------------------
_setCpuSpeed::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/portMagic.c:26: __endasm;
	ld	a, 4 (ix)
	out	(0x20), a
;../../src/portMagic.c:27: }
	pop	ix
	ret
;../../src/portMagic.c:31: void lcdCmode(char in){
;	---------------------------------
; Function lcdCmode
; ---------------------------------
_lcdCmode::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/portMagic.c:36: __endasm;
	CALL	0x000B ; set row
	ld	a, 4 (ix)
	OUT	(0x10), a
;../../src/portMagic.c:37: }
	pop	ix
	ret
;../../src/portMagic.c:38: void lcd_write(char in){
;	---------------------------------
; Function lcd_write
; ---------------------------------
_lcd_write::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/portMagic.c:47: __endasm;
	CALL	0x000B
	ld	hl, #0 + 4
	add	hl, sp
	ld	a, (hl)
	out	(0x11), a
;../../src/portMagic.c:48: }
	pop	ix
	ret
;../../src/portMagic.c:50: void fcopy(){
;	---------------------------------
; Function fcopy
; ---------------------------------
_fcopy::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../../src/portMagic.c:56: __endasm;
	CALL	0x000B
	LD	A, #0x07 ; set y inc moce
	OUT	(0x10), A
;../../src/portMagic.c:57: int count = 0;
	ld	bc, #0x0000
;../../src/portMagic.c:58: for (char y = 0x80; y <= 0xBF; ++y){
	ld	d, #0x80
00107$:
	ld	a, #0xbf
	sub	a, d
	jr	C, 00109$
;../../src/portMagic.c:59: lcdCmode(y);
	push	bc
	push	de
	push	de
	inc	sp
	call	_lcdCmode
	inc	sp
	ld	a, #0x20
	push	af
	inc	sp
	call	_lcdCmode
	inc	sp
	pop	de
	pop	bc
;../../src/portMagic.c:61: for (char x = 0; x < 12; ++x){
	ld	e, #0x00
00104$:
	ld	a, e
	sub	a, #0x0c
	jr	NC, 00115$
;../../src/portMagic.c:62: char pb = buff[count]; 
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	-1 (ix), a
	pop	hl
	push	hl
	ld	a, (hl)
;../../src/portMagic.c:63: lcd_write(pb);
	push	bc
	push	de
	push	af
	inc	sp
	call	_lcd_write
	inc	sp
	pop	de
	pop	bc
;../../src/portMagic.c:64: count++;
	inc	bc
;../../src/portMagic.c:61: for (char x = 0; x < 12; ++x){
	inc	e
	jr	00104$
00115$:
;../../src/portMagic.c:58: for (char y = 0x80; y <= 0xBF; ++y){
	inc	d
	jr	00107$
00109$:
;../../src/portMagic.c:69: }
	ld	sp, ix
	pop	ix
	ret
;../../src/portMagic.c:71: void setLCD_FULL(char st){
;	---------------------------------
; Function setLCD_FULL
; ---------------------------------
_setLCD_FULL::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/portMagic.c:77: __endasm;
	CALL	0x000B
	LD	A, #0x07 ; set y inc moce
	OUT	(0x10), A
;../../src/portMagic.c:78: for (char b = 0x80; b <= 0xBF; ++b){
	ld	c, #0x80
00107$:
	ld	a, #0xbf
	sub	a, c
	jr	C, 00109$
;../../src/portMagic.c:91: __endasm;
	ld	d, a
;ld	e, c
	CALL	0x000B ; set row
	LD	A, C
	OUT	(0x10), A
	CALL	0x000B
	LD	A, #0x20 ; reset col
	OUT	(0x10), A
	ld	a, d
;ld	c, e
;../../src/portMagic.c:92: for (char i = 0; i < 12; ++i){
	xor	a, a
00104$:
	cp	a, #0x0c
	jr	NC, 00108$
;../../src/portMagic.c:103: __endasm;
	ld	b, a
	CALL	0x000B
	ld	a, 4(ix)
	out	(0x11), a
	ld	a, b
;../../src/portMagic.c:92: for (char i = 0; i < 12; ++i){
	inc	a
	jr	00104$
00108$:
;../../src/portMagic.c:78: for (char b = 0x80; b <= 0xBF; ++b){
	inc	c
	jr	00107$
00109$:
;../../src/portMagic.c:106: }
	pop	ix
	ret
;main.c:30: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:31: clearscreen();
	call	_clearscreen
;main.c:32: init_graphics();
	call	_init_graphics
;main.c:33: badfill();
	call	_badfill
;main.c:35: fcopy();
	call	_fcopy
;main.c:36: getKey();
	call	_getKey
;main.c:40: __endasm;
	rst	0x28
	.dw	0x4027
;main.c:43: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
