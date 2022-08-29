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
	.globl _arrow
	.globl _archiveToggle
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
	.globl _line
	.globl _setpix
	.globl _pixpos
	.globl _absint
	.globl _printc
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
	jr	Z,00117$
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
	ld	c, l
	ld	b, h
	ld	-9 (ix), c
	ld	-8 (ix), b
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
	jr	Z,00104$
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
	jr	NC,00104$
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
	jr	NZ,00161$
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
	jr	NC,00107$
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
	jr	Z,00107$
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
;../../src/assetManager.c:17: nullcp((char*)(0x8478), name);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	hl, #0x8478
	push	hl
	call	_nullcp
	pop	af
	pop	af
;../../src/assetManager.c:18: char br = name[0];
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, (bc)
;../../src/assetManager.c:20: bcall(0x42F1);
	rst	40 
	.dw 0x42F1 
;../../src/assetManager.c:23: __endasm;
	ld	a, b
;../../src/assetManager.c:25: if (br != 0)
	or	a, a
	jr	Z,00102$
;../../src/assetManager.c:26: return br;
	ld	l, a
	ld	h, #0x00
	jr	00104$
00102$:
;../../src/assetManager.c:32: __endasm;
	ld	h, d
	ld	l, e
00104$:
;../../src/assetManager.c:35: }
	pop	ix
	ret
;../../src/assetManager.c:38: void archiveToggle(char* name){	
;	---------------------------------
; Function archiveToggle
; ---------------------------------
_archiveToggle::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/assetManager.c:39: nullcp((char*)(0x8478), name);
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	hl, #0x8478
	push	hl
	call	_nullcp
	pop	af
	pop	af
;../../src/assetManager.c:40: bcall(0x4FD8);
	rst	40 
	.dw 0x4FD8 
;../../src/assetManager.c:41: }
	pop	ix
	ret
;main.c:24: void arrow(int x, int y, char rot){
;	---------------------------------
; Function arrow
; ---------------------------------
_arrow::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-12
	add	hl, sp
	ld	sp, hl
;main.c:25: int ax = x+arrowSize;
	ld	a, 4 (ix)
	add	a, #0x05
	ld	-12 (ix), a
	ld	a, 5 (ix)
	adc	a, #0x00
	ld	-11 (ix), a
;main.c:26: int ay = y+arrowSize;
	ld	a, 6 (ix)
	add	a, #0x05
	ld	c, a
	ld	a, 7 (ix)
	adc	a, #0x00
	ld	b, a
;main.c:30: line(x, ay, x-pointSize, ay-pointSize);
	ld	e, c
	ld	d, b
	dec	de
	dec	de
	ld	a, 4 (ix)
	add	a, #0xfe
	ld	-10 (ix), a
	ld	a, 5 (ix)
	adc	a, #0xff
	ld	-9 (ix), a
;main.c:31: line(x, ay, x+pointSize, ay-pointSize);
	ld	a, 4 (ix)
	add	a, #0x02
	ld	-8 (ix), a
	ld	a, 5 (ix)
	adc	a, #0x00
	ld	-7 (ix), a
;main.c:28: if (rot == 1){
	ld	a, 8 (ix)
	dec	a
	jr	NZ,00116$
;main.c:29: line(x, y, x, ay);
	push	bc
	push	de
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;main.c:30: line(x, ay, x-pointSize, ay-pointSize);
	push	bc
	push	de
	push	de
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;main.c:31: line(x, ay, x+pointSize, ay-pointSize);
	push	de
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jp	00118$
00116$:
;main.c:35: line(ax, ay, ax-pointSize, ay);
	ld	a, -12 (ix)
	add	a, #0xfe
	ld	-6 (ix), a
	ld	a, -11 (ix)
	adc	a, #0xff
	ld	-5 (ix), a
;main.c:33: else if (rot == 0){
	ld	a, 8 (ix)
	or	a, a
	jr	NZ,00113$
;main.c:34: line(x, y, ax, ay);
	push	bc
	push	de
	push	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;main.c:35: line(ax, ay, ax-pointSize, ay);
	push	bc
	push	de
	push	bc
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	push	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;main.c:36: line(ax, ay, ax, ay-pointSize);
	push	de
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	push	bc
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jp	00118$
00113$:
;main.c:39: ax-=arrowSize;
	ld	a, -12 (ix)
	add	a, #0xfb
	ld	-4 (ix), a
	ld	a, -11 (ix)
	adc	a, #0xff
	ld	-3 (ix), a
;main.c:40: x-=arrowSize;
	ld	a, 4 (ix)
	add	a, #0xfb
	ld	-2 (ix), a
	ld	a, 5 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
;main.c:38: else if (rot == 2){
	ld	a, 8 (ix)
	sub	a, #0x02
	jr	NZ,00110$
;main.c:39: ax-=arrowSize;
;main.c:40: x-=arrowSize;
	ld	a, -2 (ix)
	ld	4 (ix), a
	ld	a, -1 (ix)
	ld	5 (ix), a
;main.c:41: line(x, ay, ax, y);
	push	bc
	push	de
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;main.c:42: line(x, ay, x+pointSize, ay);
	ld	a, 4 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	ld	a, 5 (ix)
	adc	a, #0x00
	ld	-1 (ix), a
	push	bc
	push	de
	push	bc
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	pop	de
	pop	bc
;main.c:43: line(x, ay, x, ay-pointSize);
	push	de
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jp	00118$
00110$:
;main.c:51: ay-=arrowSize;
	ld	a, c
	add	a, #0xfb
	ld	c, a
	ld	a, b
	adc	a, #0xff
	ld	b, a
;main.c:52: y-=arrowSize;
	ld	a, 6 (ix)
	add	a, #0xfb
	ld	e, a
	ld	a, 7 (ix)
	adc	a, #0xff
	ld	d, a
;main.c:48: else if (rot == 3){
	ld	a, 8 (ix)
	sub	a, #0x03
	jp	NZ,00107$
;main.c:49: ax-=arrowSize;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
;main.c:50: x-=arrowSize;
	ld	a, -2 (ix)
	ld	4 (ix), a
	ld	a, -1 (ix)
	ld	5 (ix), a
;main.c:51: ay-=arrowSize;
;main.c:52: y-=arrowSize;
	ld	6 (ix), e
	ld	7 (ix), d
;main.c:53: line(x, y, ax, ay);
	push	bc
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;main.c:54: line(x, y, x+pointSize, y);
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	inc	bc
	inc	bc
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	push	bc
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;main.c:55: line(x, y, x, y+pointSize);
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	inc	bc
	inc	bc
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jp	00118$
00107$:
;main.c:57: else if (rot == 4){
	ld	a, 8 (ix)
	sub	a, #0x04
	jr	NZ,00104$
;main.c:58: ay-=arrowSize;
;main.c:59: y-=arrowSize;
	ld	6 (ix), e
	ld	7 (ix), d
;main.c:60: line(x, y, x, ay);
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;main.c:61: line(x, y, x-pointSize, y+pointSize);
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	inc	bc
	inc	bc
	push	bc
	push	bc
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
	jr	00118$
00104$:
;main.c:64: else if (rot == 5){
	ld	a, 8 (ix)
	sub	a, #0x05
	jr	NZ,00118$
;main.c:65: ay-=arrowSize;
;main.c:66: y-=arrowSize;
;main.c:67: line(x, ay, ax, y);
	ld	6 (ix), e
	ld	7 (ix), d
	push	de
	pop	de
	pop	hl
	push	hl
	push	de
	push	hl
	push	bc
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;main.c:68: line(ax, y, ax-pointSize, y);
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
;main.c:69: line(ax, y, ax, y+pointSize);
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	inc	bc
	inc	bc
	push	bc
	pop	bc
	pop	hl
	push	hl
	push	bc
	push	hl
	ld	l, 6 (ix)
	ld	h, 7 (ix)
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	call	_line
	ld	hl, #8
	add	hl, sp
	ld	sp, hl
00118$:
;main.c:71: }
	ld	sp, ix
	pop	ix
	ret
;main.c:74: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-34
	add	hl, sp
	ld	sp, hl
;main.c:75: int offsets[] = { 0, 26, 52, 78, 104, 130, 156, 182 };
	ld	hl, #0
	add	hl, sp
	ld	-18 (ix), l
	ld	-17 (ix), h
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
	ld	l, -18 (ix)
	ld	h, -17 (ix)
	inc	hl
	inc	hl
	ld	(hl), #0x1a
	inc	hl
	ld	(hl), #0x00
	ld	a, -18 (ix)
	add	a, #0x04
	ld	l, a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x34
	inc	hl
	ld	(hl), #0x00
	ld	a, -18 (ix)
	add	a, #0x06
	ld	l, a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x4e
	inc	hl
	ld	(hl), #0x00
	ld	a, -18 (ix)
	add	a, #0x08
	ld	l, a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x68
	inc	hl
	ld	(hl), #0x00
	ld	a, -18 (ix)
	add	a, #0x0a
	ld	l, a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x82
	inc	hl
	ld	(hl), #0x00
	ld	a, -18 (ix)
	add	a, #0x0c
	ld	l, a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0x9c
	inc	hl
	ld	(hl), #0x00
	ld	a, -18 (ix)
	add	a, #0x0e
	ld	l, a
	ld	a, -17 (ix)
	adc	a, #0x00
	ld	h, a
	ld	(hl), #0xb6
	inc	hl
	ld	(hl), #0x00
;main.c:77: init_graphics();
	call	_init_graphics
;main.c:78: clearscreen();
	call	_clearscreen
;main.c:80: badclr();
	call	_badclr
;main.c:88: int loc = getInfo("datatale\0")+2;
	ld	hl, #___str_0
	push	hl
	call	_getInfo
	pop	af
	inc	hl
	inc	hl
	ld	c,l
	ld	b,h
	ld	-16 (ix), c
	ld	-15 (ix), b
;main.c:90: int* hwidth = (int*)(loc+HEART_0_WIDTH_OFF);
	ld	a, -16 (ix)
	ld	-14 (ix), a
	ld	a, -15 (ix)
	ld	-13 (ix), a
;main.c:91: int* hheight = (int*)(loc+HEART_0_HEIGHT_OFF);
	ld	a, -16 (ix)
	add	a, #0x04
	ld	c, a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	b, a
	ld	-12 (ix), c
	ld	-11 (ix), b
;main.c:92: char* img = (char*)(loc+HEART_0_HEIGHT_OFF+4);
	ld	a, -16 (ix)
	add	a, #0x08
	ld	c, a
	ld	a, -15 (ix)
	adc	a, #0x00
	ld	b, a
	ld	-10 (ix), c
	ld	-9 (ix), b
;main.c:93: int x = 0;
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
;main.c:95: int y = 0;
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
;main.c:97: int r = 0;
	xor	a, a
	ld	-8 (ix), a
	ld	-7 (ix), a
;main.c:99: while (true){
00123$:
;main.c:100: badclr();
	call	_badclr
;main.c:101: int keyid = getKeyId();
	call	_getKeyId
	ld	c, l
	ld	b, h
	ld	-6 (ix), c
;main.c:102: if (keyid !=0){
	ld	-5 (ix), b
	ld	a, b
	or	a, -6 (ix)
	jp	Z, 00121$
;main.c:103: if (keyid == 15){
	ld	a, -6 (ix)
	sub	a, #0x0f
	or	a, -5 (ix)
	jp	Z,00125$
	jr	00113$
;main.c:105: return;
	jp	00125$
00113$:
;main.c:107: else if (keyid == 1){ // down
	ld	a, -6 (ix)
	dec	a
	or	a, -5 (ix)
	jr	NZ,00110$
;main.c:108: y+=2;
	ld	a, -2 (ix)
	add	a, #0x02
	ld	-2 (ix), a
	jr	NC,00114$
	inc	-1 (ix)
	jr	00114$
00110$:
;main.c:111: else if (keyid == 4){ // up
	ld	a, -6 (ix)
	sub	a, #0x04
	or	a, -5 (ix)
	jr	NZ,00107$
;main.c:112: y-=2;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	jr	00114$
00107$:
;main.c:115: else if (keyid == 2){ // left
	ld	a, -6 (ix)
	sub	a, #0x02
	or	a, -5 (ix)
	jr	NZ,00104$
;main.c:116: x-=2;
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	dec	hl
	dec	hl
	ld	-4 (ix), l
	ld	-3 (ix), h
	jr	00114$
00104$:
;main.c:119: else if (keyid == 3){ // right
	ld	a, -6 (ix)
	sub	a, #0x03
	or	a, -5 (ix)
	jr	NZ,00114$
;main.c:120: x+=2;
	ld	a, -4 (ix)
	add	a, #0x02
	ld	-4 (ix), a
	jr	NC,00183$
	inc	-3 (ix)
00183$:
00114$:
;main.c:122: int xddr = XMAX-((*hwidth)*4);
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	a, -6 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	ld	-5 (ix), a
	ld	a, #0x02+1
	jr	00185$
00184$:
	sla	-6 (ix)
	rl	-5 (ix)
00185$:
	dec	a
	jr	NZ,00184$
	ld	a, #0x60
	sub	a, -6 (ix)
	ld	-10 (ix), a
	ld	a, #0x00
	sbc	a, -5 (ix)
	ld	-9 (ix), a
;main.c:123: if (x < 0)
	bit	7, -3 (ix)
	jr	Z,00118$
;main.c:124: x = 0;
	xor	a, a
	ld	-4 (ix), a
	ld	-3 (ix), a
	jr	00119$
00118$:
;main.c:125: else if (x > xddr)
	ld	a, -10 (ix)
	sub	a, -4 (ix)
	ld	a, -9 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00186$
	xor	a, #0x80
00186$:
	jp	P, 00119$
;main.c:126: x = xddr;
	ld	a, -10 (ix)
	ld	-4 (ix), a
	ld	a, -9 (ix)
	ld	-3 (ix), a
00119$:
;main.c:127: int off = offsets[x%8];
	ld	hl, #0x0008
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	add	hl, hl
	ld	e, -18 (ix)
	ld	d, -17 (ix)
	add	hl, de
	ld	a, (hl)
	inc	hl
	ld	b, (hl)
;main.c:128: hwidth = (int*)(loc+off);
	add	a, -16 (ix)
	ld	c, a
	ld	a, b
	adc	a, -15 (ix)
	ld	b, a
	ld	-14 (ix), c
	ld	-13 (ix), b
;main.c:129: hheight = (int*)(loc+off+4);
	ld	hl, #0x0004
	add	hl, bc
	ld	-12 (ix), l
	ld	-11 (ix), h
;main.c:130: img = (char*)(loc+off+8);
	ld	hl, #0x0008
	add	hl, bc
	ld	-10 (ix), l
	ld	-9 (ix), h
00121$:
;main.c:132: ++r;
	ld	c, -8 (ix)
	ld	b, -7 (ix)
	inc	bc
;main.c:133: r = r%6;
	ld	hl, #0x0006
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	ld	-8 (ix), c
	ld	-7 (ix), b
;main.c:134: drawBitmapStriped(x-(x%8), y, *hwidth, *hheight, img);
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	ld	a, (hl)
	ld	-6 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-5 (ix), a
	ld	l, -14 (ix)
	ld	h, -13 (ix)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	hl, #0x0008
	push	hl
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	b, h
	pop	de
	ld	a, -4 (ix)
	sub	a, c
	ld	c, a
	ld	a, -3 (ix)
	sbc	a, b
	ld	b, a
	ld	l, -10 (ix)
	ld	h, -9 (ix)
	push	hl
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	push	hl
	push	de
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	push	hl
	push	bc
	call	_drawBitmapStriped
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
;main.c:135: arrow(20, 20, r);
	ld	a, -8 (ix)
	push	af
	inc	sp
	ld	hl, #0x0014
	push	hl
	ld	l, #0x14
	push	hl
	call	_arrow
	pop	af
	pop	af
	inc	sp
;main.c:136: wait(2);
	ld	a, #0x02
	push	af
	inc	sp
	call	_wait
	inc	sp
;main.c:139: swap();
	call	_swap
	jp	00123$
;main.c:147: getKey();
00125$:
;main.c:148: }
	ld	sp, ix
	pop	ix
	ret
___str_0:
	.ascii "datatale"
	.db 0x00
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
