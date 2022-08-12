;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _makeApple
	.globl _checkCol
	.globl _move
	.globl _drawapple
	.globl _drawblock
	.globl _menu_loop
	.globl _menu_putstr
	.globl _randomInt
	.globl _resetRandomSeed
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _wait128
	.globl _numberslong
	.globl _number
	.globl _badfill
	.globl _badclr
	.globl _line
	.globl _setpix
	.globl _pixpos
	.globl _min
	.globl _max
	.globl _absint
	.globl _printc
	.globl ___cio__current_line
	.globl _hardness
	.globl _Vtrack
	.globl _by
	.globl _bx
	.globl _bklen
	.globl _ay
	.globl _ax
	.globl _hy
	.globl _hx
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
_hx::
	.ds 2
_hy::
	.ds 2
_ax::
	.ds 2
_ay::
	.ds 2
_bklen::
	.ds 2
_bx::
	.ds 2
_by::
	.ds 2
_Vtrack::
	.ds 2
_hardness::
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
	ld	ix,#0
	add	ix,sp
;../../src/cio.c:68: print(s);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
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
;../../src/crapmath.c:63: int absint(int x){
;	---------------------------------
; Function absint
; ---------------------------------
_absint::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:64: if (x<0){
	bit	7, 5 (ix)
	jr	Z,00102$
;../../src/crapmath.c:65: return 0-x;
	xor	a, a
	sub	a, 4 (ix)
	ld	c, a
	ld	a, #0x00
	sbc	a, 5 (ix)
	ld	b, a
	ld	l, c
	ld	h, b
	jr	00103$
00102$:
;../../src/crapmath.c:67: return x;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
00103$:
;../../src/crapmath.c:68: }
	pop	ix
	ret
;../../src/crapmath.c:74: int max(int x, int y){
;	---------------------------------
; Function max
; ---------------------------------
_max::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:75: if (x<y){
	ld	a, 4 (ix)
	sub	a, 6 (ix)
	ld	a, 5 (ix)
	sbc	a, 7 (ix)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P, 00102$
;../../src/crapmath.c:76: return y;
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	jr	00103$
00102$:
;../../src/crapmath.c:78: return x;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
00103$:
;../../src/crapmath.c:79: }
	pop	ix
	ret
;../../src/crapmath.c:80: int min(int x, int y){
;	---------------------------------
; Function min
; ---------------------------------
_min::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/crapmath.c:81: if (x<y){
	ld	a, 4 (ix)
	sub	a, 6 (ix)
	ld	a, 5 (ix)
	sbc	a, 7 (ix)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P, 00102$
;../../src/crapmath.c:82: return x;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	jr	00103$
00102$:
;../../src/crapmath.c:84: return y;
	ld	l, 6 (ix)
	ld	h, 7 (ix)
00103$:
;../../src/crapmath.c:85: }
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
	jr	Z,00103$
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
	ld	c, l
	ld	b, h
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	ld	a, (de)
	ld	-1 (ix), a
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
	ld	b, a
	ld	c, #0x01
	inc	b
	jr	00104$
00103$:
	sla	c
00104$:
	djnz	00103$
	ld	a, -1 (ix)
	or	a, c
	ld	(de), a
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
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	bc
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
	ld	c, l
	ld	b, h
	ld	a, 6 (ix)
	sub	a, 10 (ix)
	ld	a, 7 (ix)
	sbc	a, 11 (ix)
	jp	PO, 00205$
	xor	a, #0x80
00205$:
	rlca
	and	a,#0x01
	ld	e, a
	or	a, a
	jr	Z,00127$
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
	ld	a, e
	or	a, a
	jr	Z,00129$
	ld	de, #0x0001
	jr	00130$
00129$:
	ld	de, #0xffff
00130$:
	ld	-10 (ix), e
	ld	-9 (ix), d
;../../src/graphics.c:50: int err = (dx>dy ? dx : -dy)/2, e2;
	ld	a, c
	sub	a, -14 (ix)
	ld	a, b
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
	sbc	hl, bc
00132$:
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z,00133$
	ex	de,hl
	inc	de
00133$:
	ld	-5 (ix), e
	ld	-4 (ix), d
	sra	-4 (ix)
	rr	-5 (ix)
;../../src/graphics.c:51: int pp = pixpos(x0, y0);
	push	bc
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_pixpos
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	-3 (ix), e
	ld	-2 (ix), d
;../../src/graphics.c:52: char pxor = 1<<(7-(x0%8));
	push	bc
	ld	hl, #0x0008
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	e, l
	pop	bc
	ld	a, #0x07
	sub	a, e
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
	jr	Z,00210$
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
	jr	NC,00102$
	ld	a, 6 (ix)
	sub	a, #0x40
	ld	a, 7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00102$
;../../src/graphics.c:55: buff[pp] |= pxor;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, -3 (ix)
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, -2 (ix)
	ld	d, a
	ld	a, (de)
	or	a, -1 (ix)
	ld	(de), a
00102$:
;../../src/graphics.c:56: if (x0==x1 && y0==y1) break;
	ld	a, 4 (ix)
	sub	a, 8 (ix)
	jr	NZ,00105$
	ld	a, 5 (ix)
	sub	a, 9 (ix)
	jr	NZ,00105$
	ld	a, 6 (ix)
	sub	a, 10 (ix)
	jr	NZ,00213$
	ld	a, 7 (ix)
	sub	a, 11 (ix)
	jp	Z,00123$
00213$:
00105$:
;../../src/graphics.c:57: e2 = err;
	ld	e, -5 (ix)
	ld	d, -4 (ix)
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
	sub	a, c
	ld	-5 (ix), a
	ld	a, -4 (ix)
	sbc	a, b
	ld	-4 (ix), a
;../../src/graphics.c:59: if (sx == 1){
	ld	a, -8 (ix)
	or	a, a
	jr	Z,00114$
;../../src/graphics.c:61: if (pxor != 1)
	ld	a, -1 (ix)
	dec	a
	jr	Z,00108$
;../../src/graphics.c:62: pxor = pxor>>1;
	srl	-1 (ix)
	jr	00109$
00108$:
;../../src/graphics.c:64: pp+=1;
	inc	-3 (ix)
	jr	NZ,00216$
	inc	-2 (ix)
00216$:
;../../src/graphics.c:65: pxor=128;
	ld	-1 (ix), #0x80
00109$:
;../../src/graphics.c:67: x0+=1;
	inc	4 (ix)
	jr	NZ,00117$
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
	jr	Z,00111$
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
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
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
	jr	Z,00113$
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
	ex	de,hl
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
	jr	NZ,00110$
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
	jr	NZ,00132$
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
	jr	NZ,00101$
;../../src/graphics.c:119: i--;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	dec	bc
00106$:
;../../src/graphics.c:120: for(;i>=0; i--){
	bit	7, b
	jr	NZ,00108$
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
;../../src/graphics.c:149: void wait128(unsigned char x){ // Wait for amount of time (1/128th of sec)
;	---------------------------------
; Function wait128
; ---------------------------------
_wait128::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/graphics.c:166: __endasm;
	di
	ld	a,#0x46 ;128 hz
	out	(#0x30),a
	ld	a,#0x00 ; no loop, no interrupt
	out	(#0x31),a
	ld	a,4(ix)
	out	(#0x32),a
	    wait2:
	in	a,(4)
	bit	5,a ;bit 5 tells if timer 1
	jr	z,wait2 ;is done
	xor	a
	out	(#0x30),a ;Turn off the timer.
	out	(#0x31),a
;../../src/graphics.c:167: }
	pop	ix
	ret
;../../src/graphics.c:170: void swap(){
;	---------------------------------
; Function swap
; ---------------------------------
_swap::
;../../src/graphics.c:171: bcall(0x486A);
	rst	40 
	.dw 0x486A 
;../../src/graphics.c:174: }
	ret
;../../src/graphics.c:176: int getKeyId(){
;	---------------------------------
; Function getKeyId
; ---------------------------------
_getKeyId::
;../../src/graphics.c:177: bcall(0x4015);
	rst	40 
	.dw 0x4015 
;../../src/graphics.c:178: return (int)(*((char*)(0x843F)));}
	ld	hl, #0x843f
	ld	l, (hl)
	ld	h, #0x00
	ret
;../../src/graphics.c:184: void init_graphics(){
;	---------------------------------
; Function init_graphics
; ---------------------------------
_init_graphics::
;../../src/graphics.c:185: buff = (char*)(SCREEN_BUFFER);
	ld	hl, #_buff
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x93
;../../src/graphics.c:186: }
	ret
;../../src/graphics.c:207: void resetRandomSeed(){
;	---------------------------------
; Function resetRandomSeed
; ---------------------------------
_resetRandomSeed::
;../../src/graphics.c:208: bcall(0x4B7F);
	rst	40 
	.dw 0x4B7F 
;../../src/graphics.c:209: }
	ret
;../../src/graphics.c:210: int randomInt(){
;	---------------------------------
; Function randomInt
; ---------------------------------
_randomInt::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../../src/graphics.c:211: int x = 0;
	ld	hl, #0x0000
	ex	(sp), hl
;../../src/graphics.c:212: bcall(0x4B79);
	rst	40 
	.dw 0x4B79 
;../../src/graphics.c:213: assignAToVar(&x);
	ld	hl, #0
	add	hl, sp
	push	hl
	call	_assignAToVar
	pop	af
;../../src/graphics.c:214: return x;
	pop	hl
	push	hl
;../../src/graphics.c:215: }
	ld	sp, ix
	pop	ix
	ret
;../../src/menu.c:4: void menu_putstr(char* str, int ind){
;	---------------------------------
; Function menu_putstr
; ---------------------------------
_menu_putstr::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/menu.c:5: newline();
	call	_newline
;../../src/menu.c:6: number(ind);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	call	_number
;../../src/menu.c:7: print(". ");
	ld	hl, #___str_0
	ex	(sp),hl
	call	_print
	pop	af
;../../src/menu.c:8: print(str);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_print
	pop	af
;../../src/menu.c:9: }
	pop	ix
	ret
___str_0:
	.ascii ". "
	.db 0x00
;../../src/menu.c:10: int menu_loop(){
;	---------------------------------
; Function menu_loop
; ---------------------------------
_menu_loop::
;../../src/menu.c:11: int k = getKey()-0x8E;
	call	_getKey
	ld	c, l
	ld	b, h
	ld	a, c
	add	a, #0x72
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
;../../src/menu.c:12: if (k < 0){
	bit	7, b
	jr	Z,00104$
;../../src/menu.c:13: k = 1;
	ld	bc, #0x0001
	jr	00105$
00104$:
;../../src/menu.c:14: }else if (k > 30){
	ld	a, #0x1e
	cp	a, c
	ld	a, #0x00
	sbc	a, b
	jp	PO, 00118$
	xor	a, #0x80
00118$:
	jp	P, 00105$
;../../src/menu.c:15: k = 1;
	ld	bc, #0x0001
00105$:
;../../src/menu.c:17: resetcursor();
	push	bc
	call	_resetcursor
;../../src/menu.c:18: return k;
	pop	hl
;../../src/menu.c:19: }
	ret
;main.c:60: void drawblock(int x, int y){
;	---------------------------------
; Function drawblock
; ---------------------------------
_drawblock::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	dec	sp
;main.c:61: int xa = (y*BLOCKSIZE*12)+ (x / 2);
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	bit	7, b
	jr	Z,00107$
	inc	bc
00107$:
	sra	b
	rr	c
	ex	de,hl
	add	hl, bc
;main.c:67: char st = x%2==0?0xF0:0x0F;
	push	hl
	ld	hl, #0x0002
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ex	de,hl
	pop	bc
	ld	a, d
	or	a, e
	jr	NZ,00108$
	ld	de, #0x00f0
	jr	00109$
00108$:
	ld	de, #0x000f
00109$:
	ld	-3 (ix), e
;main.c:69: for (int i = 0; i < BLOCKSIZE; i++)
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00103$:
	ld	a, -2 (ix)
	sub	a, #0x04
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00105$
;main.c:70: buff[(i*12) + xa] |= st;
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
	ld	hl, #_buff
	ld	a, (hl)
	add	a, e
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	d, a
	ld	a, (de)
	or	a, -3 (ix)
	ld	(de), a
;main.c:69: for (int i = 0; i < BLOCKSIZE; i++)
	inc	-2 (ix)
	jr	NZ,00103$
	inc	-1 (ix)
	jr	00103$
00105$:
;main.c:73: }
	ld	sp, ix
	pop	ix
	ret
;main.c:74: void drawapple(int x, int y){
;	---------------------------------
; Function drawapple
; ---------------------------------
_drawapple::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;main.c:75: int xa = (y*BLOCKSIZE*12)+ (x / 2);
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de, hl
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	bit	7, b
	jr	Z,00103$
	inc	bc
00103$:
	sra	b
	rr	c
	ex	de,hl
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;main.c:77: char st = x%2==0?0xF0:0x0F;
	ld	hl, #0x0002
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	a, b
	or	a, c
	jr	NZ,00104$
	ld	de, #0x00f0
	jr	00105$
00104$:
	ld	de, #0x000f
00105$:
	ld	-2 (ix), e
;main.c:78: char md1 = x%2==0?0xB0:0x0B;
	ld	a, b
	or	a, c
	jr	NZ,00106$
	ld	de, #0x00b0
	jr	00107$
00106$:
	ld	de, #0x000b
00107$:
	ld	-1 (ix), e
;main.c:79: char md2 = x%2==0?0x90:0x09;
	ld	a, b
	or	a, c
	jr	NZ,00108$
	ld	bc, #0x0090
	jr	00109$
00108$:
	ld	bc, #0x0009
00109$:
;main.c:80: buff[xa] = st;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, -4 (ix)
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, -3 (ix)
	ld	d, a
	ld	a, -2 (ix)
	ld	(de), a
;main.c:81: buff[xa+12] = md1;
	ld	a, -4 (ix)
	add	a, #0x0c
	ld	b, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	d, a
	dec	hl
	ld	a, (hl)
	add	a, b
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	d, a
	ld	a, -1 (ix)
	ld	(de), a
;main.c:82: buff[xa+24] = md2;
	ld	a, -4 (ix)
	add	a, #0x18
	ld	b, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	d, a
	dec	hl
	ld	a, (hl)
	add	a, b
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	d, a
	ld	a, c
	ld	(de), a
;main.c:83: buff[xa+36] = st;
	ld	a, -4 (ix)
	add	a, #0x24
	ld	c, a
	ld	a, -3 (ix)
	adc	a, #0x00
	ld	b, a
	dec	hl
	ld	a, (hl)
	add	a, c
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	b, a
	ld	a, -2 (ix)
	ld	(bc), a
;main.c:99: }
	ld	sp, ix
	pop	ix
	ret
;main.c:101: void move(int *x, int *y, char dir){
;	---------------------------------
; Function move
; ---------------------------------
_move::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:103: *x+=1;
	ld	c, 4 (ix)
	ld	b, 5 (ix)
;main.c:102: if (dir == 0){
	ld	a, 8 (ix)
	or	a, a
	jr	NZ,00110$
;main.c:103: *x+=1;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jr	00112$
00110$:
;main.c:104: }else if (dir == 1){
	ld	a, 8 (ix)
	dec	a
	jr	NZ,00107$
;main.c:105: *x-=1;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jr	00112$
00107$:
;main.c:107: *y-=1;
	ld	c, 6 (ix)
	ld	b, 7 (ix)
;main.c:106: }else if (dir == 2){
	ld	a, 8 (ix)
	sub	a, #0x02
	jr	NZ,00104$
;main.c:107: *y-=1;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	dec	de
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
	jr	00112$
00104$:
;main.c:108: }else if (dir == 3){
	ld	a, 8 (ix)
	sub	a, #0x03
	jr	NZ,00112$
;main.c:109: *y+=1;
	ld	l, c
	ld	h, b
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	inc	de
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
00112$:
;main.c:111: }
	pop	ix
	ret
;main.c:112: bool checkCol(int x, int y){
;	---------------------------------
; Function checkCol
; ---------------------------------
_checkCol::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;main.c:113: for (int i = 0; i < bklen; i++){
	ld	bc, #0x0000
00106$:
	ld	a, c
	ld	hl, #_bklen
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00130$
	xor	a, #0x80
00130$:
	jp	P, 00104$
;main.c:114: if (bx[i] == x && by[i] == y)
	ld	-2 (ix), c
	ld	-1 (ix), b
	sla	-2 (ix)
	rl	-1 (ix)
	ld	hl, #_bx
	ld	a, (hl)
	add	a, -2 (ix)
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, -1 (ix)
	ld	d, a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	cp	a, a
	sbc	hl, de
	jr	NZ,00107$
	ld	hl, #_by
	ld	a, (hl)
	add	a, -2 (ix)
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, -1 (ix)
	ld	d, a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	cp	a, a
	sbc	hl, de
	jr	NZ,00107$
;main.c:115: return true;
	ld	l, #0x01
	jr	00108$
00107$:
;main.c:113: for (int i = 0; i < bklen; i++){
	inc	bc
	jr	00106$
00104$:
;main.c:117: return false;
	ld	l, #0x00
00108$:
;main.c:118: }
	ld	sp, ix
	pop	ix
	ret
;main.c:119: void makeApple(){
;	---------------------------------
; Function makeApple
; ---------------------------------
_makeApple::
;main.c:120: do{
00101$:
;main.c:121: ax = randomInt()%XLEN;
	call	_randomInt
	ld	c, l
	ld	b, h
	ld	hl, #0x0018
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	(_ax), bc
;main.c:122: ay = randomInt()%YLEN;
	call	_randomInt
	ld	c, l
	ld	b, h
	ld	hl, #0x0010
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	(_ay), bc
;main.c:124: while (checkCol(ax, ay) | (ax == hx && ay == hy));
	ld	hl, (_ay)
	push	hl
	ld	hl, (_ax)
	push	hl
	call	_checkCol
	pop	af
	pop	af
	ld	c, l
	ld	a, (#_ax)
	ld	hl, #_hx
	sub	a, (hl)
	jr	NZ,00106$
	ld	a,(#_ax + 1)
	ld	hl, #_hx + 1
	sub	a, (hl)
	jr	NZ,00106$
	ld	a, (#_ay)
	ld	hl, #_hy
	sub	a, (hl)
	jr	NZ,00121$
	ld	a,(#_ay + 1)
	ld	hl, #_hy + 1
	sub	a, (hl)
	jr	Z,00107$
00121$:
00106$:
	xor	a, a
	jr	00108$
00107$:
	ld	a, #0x01
00108$:
	or	a, c
	bit	0, a
	jr	NZ,00101$
;main.c:125: }
	ret
;main.c:127: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-8
	add	hl, sp
	ld	sp, hl
;main.c:128: bool update = true;
	ld	-1 (ix), #0x01
;main.c:131: makeApple();
	call	_makeApple
;main.c:132: clearscreen();
	call	_clearscreen
;main.c:137: print("Select difficulty:");
	ld	hl, #___str_1
	push	hl
	call	_print
;main.c:138: menu_putstr("Easy", 1);
	ld	hl, #0x0001
	ex	(sp),hl
	ld	hl, #___str_2
	push	hl
	call	_menu_putstr
	pop	af
;main.c:139: menu_putstr("Easyish", 2);
	ld	hl, #0x0002
	ex	(sp),hl
	ld	hl, #___str_3
	push	hl
	call	_menu_putstr
	pop	af
;main.c:140: menu_putstr("Medium", 3);
	ld	hl, #0x0003
	ex	(sp),hl
	ld	hl, #___str_4
	push	hl
	call	_menu_putstr
	pop	af
;main.c:141: menu_putstr("Mediumish", 4);
	ld	hl, #0x0004
	ex	(sp),hl
	ld	hl, #___str_5
	push	hl
	call	_menu_putstr
	pop	af
;main.c:142: menu_putstr("Hard", 5);
	ld	hl, #0x0005
	ex	(sp),hl
	ld	hl, #___str_6
	push	hl
	call	_menu_putstr
	pop	af
;main.c:143: menu_putstr("Kill me", 6);
	ld	hl, #0x0006
	ex	(sp),hl
	ld	hl, #___str_7
	push	hl
	call	_menu_putstr
	pop	af
;main.c:144: menu_putstr("Im already dead", 7);
	ld	hl, #0x0007
	ex	(sp),hl
	ld	hl, #___str_8
	push	hl
	call	_menu_putstr
	pop	af
	pop	af
;main.c:145: hardness=menu_loop();
	call	_menu_loop
	ld	c, l
	ld	b, h
	ld	(_hardness), bc
;main.c:147: bklen = 0;
	ld	hl, #_bklen
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:148: hx = XLEN/2; hy = YLEN/2;
	ld	hl, #_hx
	ld	(hl), #0x0c
	inc	hl
	ld	(hl), #0x00
	ld	hl, #_hy
	ld	(hl), #0x08
	inc	hl
	ld	(hl), #0x00
;main.c:149: bx = (int*) ( VARBIN );
	ld	hl, #_bx
	ld	(hl), #0x72
	inc	hl
	ld	(hl), #0x98
;main.c:150: by = (int*) ( VARBIN+LENGTH_BYTES );
	ld	hl, #_by
	ld	(hl), #0x3a
	inc	hl
	ld	(hl), #0x99
;main.c:156: char dir = 0;
	xor	a, a
	ld	-8 (ix), a
;main.c:159: init_graphics();
	call	_init_graphics
;main.c:163: while (true){
00139$:
;main.c:169: int key = getKeyId();
	call	_getKeyId
	ld	c, l
	ld	b, h
;main.c:170: if (key != 0){
	ld	a, b
	or	a, c
	jr	Z,00116$
;main.c:171: if (key == 0x0F){
	ld	a, c
	sub	a, #0x0f
	or	a, b
	jp	Z,00150$
;main.c:174: else if (key == 1){ // down
	ld	a, c
	dec	a
	or	a, b
	jr	NZ,00110$
;main.c:175: dir=3;
	ld	-8 (ix), #0x03
	jr	00116$
00110$:
;main.c:178: else if (key == 4){ // up
	ld	a, c
	sub	a, #0x04
	or	a, b
	jr	NZ,00107$
;main.c:179: dir=2;
	ld	-8 (ix), #0x02
	jr	00116$
00107$:
;main.c:182: else if (key == 2){ // left
	ld	a, c
	sub	a, #0x02
	or	a, b
	jr	NZ,00104$
;main.c:183: dir=1;
	ld	-8 (ix), #0x01
	jr	00116$
00104$:
;main.c:185: else if (key == 3){ // right
	ld	a, c
	sub	a, #0x03
	or	a, b
	jr	NZ,00116$
;main.c:186: dir=0;
	xor	a, a
	ld	-8 (ix), a
00116$:
;main.c:193: if (update){
	bit	0, -1 (ix)
	jp	Z, 00135$
;main.c:196: for(int ii = bklen -1; ii > 0; ii--)
	ld	bc, (_bklen)
	dec	bc
00142$:
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00277$
	xor	a, #0x80
00277$:
	jp	P, 00117$
;main.c:198: bx[ii] = bx[ii-1];
	ld	-7 (ix), c
	ld	-6 (ix), b
	sla	-7 (ix)
	rl	-6 (ix)
	ld	hl, #_bx
	ld	a, (hl)
	add	a, -7 (ix)
	ld	-5 (ix), a
	inc	hl
	ld	a, (hl)
	adc	a, -6 (ix)
	ld	-4 (ix), a
	ld	a, c
	add	a, #0xff
	ld	-3 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-2 (ix), a
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	sla	e
	rl	d
	dec	hl
	ld	a, (hl)
	add	a, e
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	b, a
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;main.c:199: by[ii] = by[ii-1];
	ld	hl, #_by
	ld	a, (hl)
	add	a, -7 (ix)
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, -6 (ix)
	ld	b, a
	dec	hl
	ld	a, (hl)
	add	a, e
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	d, a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	ld	a, e
	ld	(bc), a
	inc	bc
	ld	a, d
	ld	(bc), a
;main.c:196: for(int ii = bklen -1; ii > 0; ii--)
	ld	c, -3 (ix)
	ld	b, -2 (ix)
	jr	00142$
00117$:
;main.c:201: bx[0] = hx;
	ld	bc, (_bx)
	ld	hl, #_hx
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:202: by[0] = hy;
	ld	bc, (_by)
	ld	hl, #_hy
	ld	a, (hl)
	ld	(bc), a
	inc	bc
	inc	hl
	ld	a, (hl)
	ld	(bc), a
;main.c:203: move(&hx, &hy, dir);
	ld	a, -8 (ix)
	push	af
	inc	sp
	ld	hl, #_hy
	push	hl
	ld	hl, #_hx
	push	hl
	call	_move
	pop	af
	pop	af
	inc	sp
;main.c:205: if (hx >= XLEN){
	ld	hl, #_hx
	ld	a, (hl)
	sub	a, #0x18
	inc	hl
	ld	a, (hl)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00121$
;main.c:206: hx = 0;
	dec	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	jr	00122$
00121$:
;main.c:207: }else if (hx < 0){
	ld	hl, #_hx + 1
	bit	7, (hl)
	jr	Z,00122$
;main.c:208: hx = XLEN-1;
	dec	hl
	ld	(hl), #0x17
	inc	hl
	ld	(hl), #0x00
00122$:
;main.c:210: if (hy >= YLEN){
	ld	hl, #_hy
	ld	a, (hl)
	sub	a, #0x10
	inc	hl
	ld	a, (hl)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00126$
;main.c:211: hy = 0;
	dec	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
	jr	00127$
00126$:
;main.c:212: }else if (hy < 0){
	ld	hl, #_hy + 1
	bit	7, (hl)
	jr	Z,00127$
;main.c:213: hy = YLEN;
	dec	hl
	ld	(hl), #0x10
	inc	hl
	ld	(hl), #0x00
00127$:
;main.c:217: if (checkCol(ax, ay) | (ax == hx && ay == hy)){
	ld	hl, (_ay)
	push	hl
	ld	hl, (_ax)
	push	hl
	call	_checkCol
	pop	af
	pop	af
	ld	c, l
	ld	a, (#_ax)
	ld	hl, #_hx
	sub	a, (hl)
	jr	NZ,00152$
	ld	a,(#_ax + 1)
	ld	hl, #_hx + 1
	sub	a, (hl)
	jr	NZ,00152$
	ld	a, (#_ay)
	ld	hl, #_hy
	sub	a, (hl)
	jr	NZ,00284$
	ld	a,(#_ay + 1)
	ld	hl, #_hy + 1
	sub	a, (hl)
	jr	Z,00153$
00284$:
00152$:
	xor	a, a
	jr	00154$
00153$:
	ld	a, #0x01
00154$:
	or	a, c
	bit	0, a
	jp	Z, 00130$
;main.c:218: for (int iii = bklen-1; iii < bklen+hardness; iii++){
	ld	de, (_bklen)
	dec	de
00145$:
	ld	a, (#_bklen)
	ld	hl, #_hardness
	add	a, (hl)
	ld	c, a
	ld	a,(#_bklen + 1)
	ld	hl, #_hardness + 1
	adc	a, (hl)
	ld	b, a
	ld	a, e
	sub	a, c
	ld	a, d
	sbc	a, b
	jp	PO, 00285$
	xor	a, #0x80
00285$:
	jp	P, 00128$
;main.c:219: bx[iii] = bx[0];
	ld	-5 (ix), e
	ld	-4 (ix), d
	sla	-5 (ix)
	rl	-4 (ix)
	ld	hl, #_bx
	ld	a, (hl)
	add	a, -5 (ix)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	adc	a, -4 (ix)
	ld	-2 (ix), a
	ld	bc, (_bx)
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;main.c:220: by[iii] = by[0];
	ld	hl, #_by
	ld	a, (hl)
	add	a, -5 (ix)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	adc	a, -4 (ix)
	ld	-2 (ix), a
	ld	bc, (_by)
	ld	l, c
	ld	h, b
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	(hl), c
	inc	hl
	ld	(hl), b
;main.c:218: for (int iii = bklen-1; iii < bklen+hardness; iii++){
	inc	de
	jr	00145$
00128$:
;main.c:222: bklen+=hardness;
	ld	(_bklen), bc
;main.c:223: makeApple();
	call	_makeApple
00130$:
;main.c:225: if (checkCol(hx, hy))
	ld	hl, (_hy)
	push	hl
	ld	hl, (_hx)
	push	hl
	call	_checkCol
	pop	af
	pop	af
	bit	0,l
	jp	NZ, 00150$
;main.c:232: badclr();
	call	_badclr
;main.c:233: drawapple(ax, ay);
	ld	hl, (_ay)
	push	hl
	ld	hl, (_ax)
	push	hl
	call	_drawapple
	pop	af
	pop	af
;main.c:234: drawblock(hx, hy);
	ld	hl, (_hy)
	push	hl
	ld	hl, (_hx)
	push	hl
	call	_drawblock
	pop	af
	pop	af
;main.c:235: for (int i = 0; i < bklen; i+=1){
	ld	bc, #0x0000
00148$:
	ld	a, c
	ld	hl, #_bklen
	sub	a, (hl)
	ld	a, b
	inc	hl
	sbc	a, (hl)
	jp	PO, 00288$
	xor	a, #0x80
00288$:
	jp	P, 00135$
;main.c:236: drawblock(bx[i], by[i]);
	ld	e, c
	ld	d, b
	sla	e
	rl	d
	ld	hl, #_by
	ld	a, (hl)
	add	a, e
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	-2 (ix), a
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	ld	a, (hl)
	ld	-3 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	ld	hl, #_bx
	ld	a, (hl)
	add	a, e
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	d, a
	ex	de,hl
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	bc
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	push	hl
	push	de
	call	_drawblock
	pop	af
	pop	af
	pop	bc
;main.c:235: for (int i = 0; i < bklen; i+=1){
	inc	bc
	jr	00148$
00135$:
;main.c:239: } update = !update;
	ld	a, -1 (ix)
	xor	a, #0x01
	ld	-1 (ix), a
;main.c:241: swap();
	call	_swap
;main.c:242: number(bklen/hardness);
	ld	hl, (_hardness)
	push	hl
	ld	hl, (_bklen)
	push	hl
	call	__divsint
	pop	af
	ex	(sp),hl
	call	_number
	pop	af
;main.c:243: resetcursor();
	call	_resetcursor
;main.c:244: if (bklen<30)
	ld	hl, #_bklen
	ld	a, (hl)
	sub	a, #0x1e
	inc	hl
	ld	a, (hl)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00139$
;main.c:245: wait128(6-(bklen/5));
	ld	hl, #0x0005
	push	hl
	ld	hl, (_bklen)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	c, l
	ld	a, #0x06
	sub	a, c
	push	af
	inc	sp
	call	_wait128
	inc	sp
	jp	00139$
00150$:
;main.c:253: }
	ld	sp, ix
	pop	ix
	ret
___str_1:
	.ascii "Select difficulty:"
	.db 0x00
___str_2:
	.ascii "Easy"
	.db 0x00
___str_3:
	.ascii "Easyish"
	.db 0x00
___str_4:
	.ascii "Medium"
	.db 0x00
___str_5:
	.ascii "Mediumish"
	.db 0x00
___str_6:
	.ascii "Hard"
	.db 0x00
___str_7:
	.ascii "Kill me"
	.db 0x00
___str_8:
	.ascii "Im already dead"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
