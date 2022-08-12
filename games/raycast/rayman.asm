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
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _numberslong
	.globl _number
	.globl _badfill
	.globl _badclr
	.globl _line
	.globl _setpix
	.globl _pixpos
	.globl _absint
	.globl _isqrt
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
;../../src/crapmath.c:20: unsigned long isqrt(unsigned int x){
;	---------------------------------
; Function isqrt
; ---------------------------------
_isqrt::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-20
	add	hl, sp
	ld	sp, hl
;../../src/crapmath.c:21: for (unsigned long i = 0; i < x; i+=10){
	xor	a, a
	ld	-20 (ix), a
	ld	-19 (ix), a
	ld	-18 (ix), a
	ld	-17 (ix), a
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
	ld	-6 (ix), a
	ld	-5 (ix), a
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	ld	-2 (ix), a
	ld	-1 (ix), a
00113$:
	ld	a, 4 (ix)
	ld	-16 (ix), a
	ld	a, 5 (ix)
	ld	-15 (ix), a
	xor	a, a
	ld	-14 (ix), a
	ld	-13 (ix), a
	ld	a, -8 (ix)
	sub	a, -16 (ix)
	ld	a, -7 (ix)
	sbc	a, -15 (ix)
	ld	a, -6 (ix)
	sbc	a, -14 (ix)
	ld	a, -5 (ix)
	sbc	a, -13 (ix)
	jp	NC, 00115$
;../../src/crapmath.c:23: unsigned long b = (i/10)*(i/10);
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	-12 (ix), l
	ld	-11 (ix), h
	ld	-10 (ix), e
	ld	-9 (ix), d
;../../src/crapmath.c:25: if (b == x)
	ld	a, -12 (ix)
	sub	a, -16 (ix)
	jr	NZ,00102$
	ld	a, -11 (ix)
	sub	a, -15 (ix)
	jr	NZ,00102$
	ld	a, -10 (ix)
	sub	a, -14 (ix)
	jr	NZ,00102$
	ld	a, -9 (ix)
	sub	a, -13 (ix)
	jr	NZ,00102$
;../../src/crapmath.c:26: return i;
	ld	l, -20 (ix)
	ld	h, -19 (ix)
	ld	e, -18 (ix)
	ld	d, -17 (ix)
	jp	00115$
00102$:
;../../src/crapmath.c:28: if (b > x){
	ld	a, -16 (ix)
	sub	a, -12 (ix)
	ld	a, -15 (ix)
	sbc	a, -11 (ix)
	ld	a, -14 (ix)
	sbc	a, -10 (ix)
	ld	a, -13 (ix)
	sbc	a, -9 (ix)
	jp	NC, 00114$
;../../src/crapmath.c:30: unsigned long c = (i-10);
	ld	a, -20 (ix)
	add	a, #0xf6
	ld	-4 (ix), a
	ld	a, -19 (ix)
	adc	a, #0xff
	ld	-3 (ix), a
	ld	a, -18 (ix)
	adc	a, #0xff
	ld	-2 (ix), a
	ld	a, -17 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
;../../src/crapmath.c:36: for (unsigned int per = 1; per < 10; ++per){
	ld	-8 (ix), #0x01
	xor	a, a
	ld	-7 (ix), a
	ld	-6 (ix), #0x01
	xor	a, a
	ld	-5 (ix), a
00110$:
	ld	a, -6 (ix)
	sub	a, #0x0a
	ld	a, -5 (ix)
	sbc	a, #0x00
	jp	NC, 00105$
;../../src/crapmath.c:38: unsigned long d = c+(per*10*100);
	ld	c, -6 (ix)
	ld	b, -5 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0000
	ld	a, l
	add	a, -4 (ix)
	ld	e, a
	ld	a, h
	adc	a, -3 (ix)
	ld	d, a
	ld	a, c
	adc	a, -2 (ix)
	ld	c, a
	ld	a, b
	adc	a, -1 (ix)
	ld	b, a
;../../src/crapmath.c:42: d=d*d/10000;
	push	bc
	push	de
	push	bc
	push	de
	call	__mullong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x2710
	push	hl
	push	de
	push	bc
	call	__divulong
	pop	af
	pop	af
	pop	af
	pop	af
	ld	c, l
	ld	b, h
;../../src/crapmath.c:44: if (d > x){
	ld	a, -16 (ix)
	sub	a, c
	ld	a, -15 (ix)
	sbc	a, b
	ld	a, -14 (ix)
	sbc	a, e
	ld	a, -13 (ix)
	sbc	a, d
	jr	NC,00111$
;../../src/crapmath.c:45: c += ((per-1)*10*100);
	ld	a, -8 (ix)
	add	a, #0xff
	ld	-6 (ix), a
	ld	a, -7 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
	ld	c, -6 (ix)
	ld	b, -5 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	-6 (ix), l
	ld	-5 (ix), h
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	xor	a, a
	ld	-6 (ix), a
	ld	-5 (ix), a
	ld	a, -8 (ix)
	add	a, -4 (ix)
	ld	-4 (ix), a
	ld	a, -7 (ix)
	adc	a, -3 (ix)
	ld	-3 (ix), a
	ld	a, -6 (ix)
	adc	a, -2 (ix)
	ld	-2 (ix), a
	ld	a, -5 (ix)
	adc	a, -1 (ix)
	ld	-1 (ix), a
;../../src/crapmath.c:47: break;
	jr	00105$
00111$:
;../../src/crapmath.c:36: for (unsigned int per = 1; per < 10; ++per){
	inc	-6 (ix)
	jr	NZ,00154$
	inc	-5 (ix)
00154$:
	ld	a, -6 (ix)
	ld	-8 (ix), a
	ld	a, -5 (ix)
	ld	-7 (ix), a
	jp	00110$
00105$:
;../../src/crapmath.c:52: return c/10;
	ld	hl, #0x0000
	push	hl
	ld	hl, #0x000a
	push	hl
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	__divulong
	pop	af
	pop	af
	pop	af
	pop	af
	jr	00115$
00114$:
;../../src/crapmath.c:21: for (unsigned long i = 0; i < x; i+=10){
	inc	-4 (ix)
	jr	NZ,00155$
	inc	-3 (ix)
	jr	NZ,00155$
	inc	-2 (ix)
	jr	NZ,00155$
	inc	-1 (ix)
00155$:
	ld	a, -8 (ix)
	add	a, #0x0a
	ld	-8 (ix), a
	ld	a, -7 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
	ld	a, -6 (ix)
	adc	a, #0x00
	ld	-6 (ix), a
	jr	NC,00156$
	inc	-5 (ix)
00156$:
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	hl, #12
	add	hl, sp
	ld	bc, #4
	ldir
	jp	00113$
00115$:
;../../src/crapmath.c:55: }
	ld	sp, ix
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
	jr	Z,00102$
;../../src/crapmath.c:122: return 0-x;
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
;main.c:50: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-68
	add	hl, sp
	ld	sp, hl
;main.c:51: int px = 3;
	ld	-12 (ix), #0x03
	xor	a, a
	ld	-11 (ix), a
;main.c:52: int py = 8;
	ld	-10 (ix), #0x08
	xor	a, a
	ld	-9 (ix), a
;main.c:55: char map[] = {
	ld	hl, #0
	add	hl, sp
	ld	-26 (ix), l
	ld	-25 (ix), h
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x01
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x03
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x04
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x05
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x06
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x07
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x08
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x09
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x0a
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x0b
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x0c
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x0d
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x0e
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x0f
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x10
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x11
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x12
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x13
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x14
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x15
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x16
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x17
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x18
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x19
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x1a
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x1b
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x1c
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x1d
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x1e
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x1f
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x20
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x21
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x22
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x23
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x24
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
	ld	a, -26 (ix)
	add	a, #0x25
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x26
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x27
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x28
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x00
	ld	a, -26 (ix)
	add	a, #0x29
	ld	-2 (ix), a
	ld	a, -25 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	(hl), #0x01
;main.c:68: clearscreen();
	call	_clearscreen
;main.c:69: init_graphics();
	call	_init_graphics
;main.c:92: bool update = true;
	ld	-24 (ix), #0x01
;main.c:93: while (true){
00128$:
;main.c:95: int key = getKeyId();
	call	_getKeyId
	ld	-2 (ix), l
;main.c:96: if (key != 0){
	ld	-1 (ix), h
	ld	a, h
	or	a, -2 (ix)
	jr	Z,00116$
;main.c:97: if (key == 0x0F){
	ld	a, -2 (ix)
	sub	a, #0x0f
	or	a, -1 (ix)
	jp	Z,00129$
;main.c:100: else if (key == 1){ // down
	ld	a, -2 (ix)
	dec	a
	or	a, -1 (ix)
	jr	NZ,00110$
;main.c:101: py+=1;
	inc	-10 (ix)
	jr	NZ,00114$
	inc	-9 (ix)
	jr	00114$
00110$:
;main.c:104: else if (key == 4){ // up
	ld	a, -2 (ix)
	sub	a, #0x04
	or	a, -1 (ix)
	jr	NZ,00107$
;main.c:105: py-=1;
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	dec	hl
	ld	-10 (ix), l
	ld	-9 (ix), h
	jr	00114$
00107$:
;main.c:108: else if (key == 2){ // left
	ld	a, -2 (ix)
	sub	a, #0x02
	or	a, -1 (ix)
	jr	NZ,00104$
;main.c:109: px-=1;
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	dec	hl
	ld	-12 (ix), l
	ld	-11 (ix), h
	jr	00114$
00104$:
;main.c:111: else if (key == 3){ // right
	ld	a, -2 (ix)
	sub	a, #0x03
	or	a, -1 (ix)
	jr	NZ,00114$
;main.c:112: px+=1;
	inc	-12 (ix)
	jr	NZ,00252$
	inc	-11 (ix)
00252$:
00114$:
;main.c:114: update=true;
	ld	-24 (ix), #0x01
00116$:
;main.c:120: if (update){
	bit	0, -24 (ix)
	jp	Z, 00128$
;main.c:121: update=false;
	xor	a, a
	ld	-24 (ix), a
;main.c:122: badclr();
	call	_badclr
;main.c:125: for (int i = 0; i < v; ++i){
	ld	c, -12 (ix)
	ld	b, -11 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #0x0032
	add	hl, de
	ld	-23 (ix), l
	ld	-22 (ix), h
	ld	c, -10 (ix)
	ld	b, -9 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	de, #0x0064
	add	hl, de
	ld	-21 (ix), l
	ld	-20 (ix), h
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
00137$:
	ld	a, -8 (ix)
	sub	a, #0x60
	ld	a, -7 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00124$
;main.c:126: int cameraX = 2 * i*100 / v - 100;
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ld	bc, #0x0060
	push	bc
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	a, c
	add	a, #0x9c
	ld	-14 (ix), a
	ld	a, b
	adc	a, #0xff
	ld	-13 (ix), a
;main.c:127: int rx = ((px*100))+50;
	ld	a, -23 (ix)
	ld	-6 (ix), a
	ld	a, -22 (ix)
	ld	-5 (ix), a
;main.c:128: int ry = (py*100)+100;
	ld	a, -21 (ix)
	ld	-2 (ix), a
	ld	a, -20 (ix)
	ld	-1 (ix), a
;main.c:132: int rayDirY = cameraX/2;
	ld	a, -14 (ix)
	ld	-4 (ix), a
	ld	a, -13 (ix)
	ld	-3 (ix), a
	bit	7, -13 (ix)
	jr	Z,00141$
	ld	a, -14 (ix)
	add	a, #0x01
	ld	-4 (ix), a
	ld	a, -13 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
00141$:
	ld	c, -4 (ix)
	ld	b, -3 (ix)
	sra	b
	rr	c
;main.c:134: for (int yy = 0; yy < 32; ++yy){
	xor	a, a
	ld	-19 (ix), a
	ld	-18 (ix), a
	ld	e, c
	ld	d, b
	inc	de
	ld	a, b
	rlca
	and	a,#0x01
	ld	-17 (ix), a
	ld	a, -2 (ix)
	ld	-4 (ix), a
	ld	a, -1 (ix)
	ld	-3 (ix), a
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00134$:
	ld	a, -2 (ix)
	sub	a, #0x20
	ld	a, -1 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00138$
;main.c:135: int orx = rx; int ory = ry; int ama = rx/100 + ((ry)/100*mapX);
	push	bc
	push	de
	ld	hl, #0x0064
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	-16 (ix), l
	ld	-15 (ix), h
	ld	hl, #0x0064
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	__divsint
	pop	af
	pop	af
	ld	-14 (ix), l
	ld	-13 (ix), h
	pop	de
	pop	bc
	push	de
	ld	e, -14 (ix)
	ld	d, -13 (ix)
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	pop	de
	ld	a, -16 (ix)
	add	a, l
	ld	l, a
	ld	a, -15 (ix)
	adc	a, h
	ld	h, a
;main.c:142: if (ama > 0 && ama < mapX*mapY){
	xor	a, a
	cp	a, l
	sbc	a, h
	jp	PO, 00253$
	xor	a, #0x80
00253$:
	jp	P, 00142$
	ld	a, l
	sub	a, #0x2a
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00142$
;main.c:143: if(map[ama] == 1){
	ld	a, -26 (ix)
	add	a, l
	ld	l, a
	ld	a, -25 (ix)
	adc	a, h
	ld	h, a
	ld	a, (hl)
	dec	a
	jr	NZ,00142$
;main.c:144: for (int d = 0; d < DMIR; ++d){
	ld	a, #0x40
	sub	a, -19 (ix)
	ld	-2 (ix), a
	ld	a, #0x00
	sbc	a, -18 (ix)
	ld	-1 (ix), a
	ld	bc, #0x0000
00131$:
	ld	a, c
	sub	a, #0x01
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC,00138$
;main.c:145: line(i*DMIR+d, yy*YMULT, i*DMIR+d, YMAX-(yy*YMULT));
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	add	hl, bc
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	push	de
	push	hl
	ld	e, -19 (ix)
	ld	d, -18 (ix)
	push	de
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	bc
;main.c:144: for (int d = 0; d < DMIR; ++d){
	inc	bc
	jr	00131$
;main.c:150: ry-=rayDirX/2;
00142$:
	ld	a, -4 (ix)
	add	a, #0xce
	ld	-4 (ix), a
	ld	a, -3 (ix)
	adc	a, #0xff
	ld	-3 (ix), a
;main.c:151: rx+=rayDirY/2;
	ld	l, c
	ld	h, b
	ld	a, -17 (ix)
	or	a, a
	jr	Z,00143$
	ld	l, e
	ld	h, d
00143$:
	sra	h
	rr	l
	ld	a, l
	add	a, -6 (ix)
	ld	-6 (ix), a
	ld	a, h
	adc	a, -5 (ix)
	ld	-5 (ix), a
;main.c:134: for (int yy = 0; yy < 32; ++yy){
	inc	-2 (ix)
	jr	NZ,00256$
	inc	-1 (ix)
00256$:
	ld	a, -2 (ix)
	ld	-19 (ix), a
	ld	a, -1 (ix)
	ld	-18 (ix), a
	jp	00134$
00138$:
;main.c:125: for (int i = 0; i < v; ++i){
	inc	-8 (ix)
	jp	NZ,00137$
	inc	-7 (ix)
	jp	00137$
00124$:
;main.c:160: swap();
	call	_swap
	jp	00128$
00129$:
;main.c:191: getKey();
	call	_getKey
;main.c:195: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
