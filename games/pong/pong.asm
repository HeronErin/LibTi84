;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.2.0 #13081 (Linux)
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _paddle
	.globl _fast_fill
	.globl _lwait
	.globl _set_lcd
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
	.globl _absint
	.globl _printc
	.globl ___cio__current_line
	.globl _enemy_y
	.globl _player_vel
	.globl _player_y
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
_player_y::
	.ds 2
_player_vel::
	.ds 2
_enemy_y::
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
	call	_setPenRow
;../../src/cio.c:13: setPenCol(0);
	xor	a, a
;../../src/cio.c:14: }
	jp	_setPenCol
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
;../../src/cio.c:19: }
	jp	_setPenCol
;../../src/cio.c:21: void setPenCol(char col) {
;	---------------------------------
; Function setPenCol
; ---------------------------------
_setPenCol::
;../../src/cio.c:26: __endasm;
	ld	a, 4(ix)
	ld	(#0x86D7), a
;../../src/cio.c:27: }
	ret
;../../src/cio.c:29: void setPenRow(char row) {
;	---------------------------------
; Function setPenRow
; ---------------------------------
_setPenRow::
;../../src/cio.c:34: __endasm;
	ld	a, 4(ix)
	ld	(#0x86D8), a
;../../src/cio.c:35: }
	ret
;../../src/cio.c:37: void vputs(char* s) {
;	---------------------------------
; Function vputs
; ---------------------------------
_vputs::
;../../src/cio.c:42: __endasm;
	ld	l, 4(ix)
	ld	h, 5(ix)
;../../src/cio.c:43: bcall(_vputs);
	rst	40 
	.dw #0x4561 
;../../src/cio.c:44: }
	ret
;../../src/cio.c:46: void vputc(char c) {
;	---------------------------------
; Function vputc
; ---------------------------------
_vputc::
;../../src/cio.c:51: __endasm;
	ld	a, 4(ix)
;../../src/cio.c:52: bcall(_vputmap);
	rst	40 
	.dw #0x455E 
;../../src/cio.c:53: }
	ret
;../../src/cio.c:56: void printc(char c) {
;	---------------------------------
; Function printc
; ---------------------------------
_printc::
	ld	c, a
;../../src/cio.c:57: setPenRow(__cio__current_line);
	push	bc
	ld	a, (#___cio__current_line)
	call	_setPenRow
	pop	bc
;../../src/cio.c:58: vputc(c);
	ld	a, c
;../../src/cio.c:59: }
	jp	_vputc
;../../src/cio.c:61: void print(char* s) {
;	---------------------------------
; Function print
; ---------------------------------
_print::
;../../src/cio.c:62: setPenRow(__cio__current_line);
	push	hl
	ld	a, (#___cio__current_line)
	call	_setPenRow
	pop	de
;../../src/cio.c:64: vputs(s);
	ex	de, hl
;../../src/cio.c:65: }
	jp	_vputs
;../../src/cio.c:67: void println(char* s) {
;	---------------------------------
; Function println
; ---------------------------------
_println::
;../../src/cio.c:68: print(s);
	call	_print
;../../src/cio.c:69: newline();
;../../src/cio.c:70: }
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
	call	_assignAToVar
;../../src/cio.c:98: return __cio__returnValue;
	ld	hl, #___cio__returnValue
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
;../../src/cio.c:99: }
	ret
;../../src/libti.c:6: void assignAToVar(int* var) {
;	---------------------------------
; Function assignAToVar
; ---------------------------------
_assignAToVar::
;../../src/libti.c:16: __endasm;
	ld	d,4 (ix)
	ld	e,5 (ix)
	ld	l, d
	ld	h, e
	ld	(hl),a
	inc	hl
	ld	(hl),#0x00
;../../src/libti.c:17: }
	ret
;../../src/crapmath.c:120: int absint(int x){
;	---------------------------------
; Function absint
; ---------------------------------
_absint::
;../../src/crapmath.c:121: if (x<0){
	bit	7, h
	jr	Z, 00102$
;../../src/crapmath.c:122: return 0-x;
	xor	a, a
	sub	a, l
	ld	e, a
	sbc	a, a
	sub	a, h
	ld	d, a
	ret
00102$:
;../../src/crapmath.c:124: return x;
	ex	de, hl
;../../src/crapmath.c:125: }
	ret
;../../src/graphics.c:15: int pixpos(int x, int y){
;	---------------------------------
; Function pixpos
; ---------------------------------
_pixpos::
;../../src/graphics.c:16: return (x/8) + (y*12);
	ld	c, l
	ld	b, h
	bit	7, h
	jr	Z, 00103$
	ld	bc, #0x7
	add	hl,bc
	ld	c, l
	ld	b, h
00103$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, de
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ex	de, hl
;../../src/graphics.c:17: }
	ret
;../../src/graphics.c:21: void setpix(int x, int y ){
;	---------------------------------
; Function setpix
; ---------------------------------
_setpix::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	ex	(sp), hl
;../../src/graphics.c:22: buff[pixpos(x, y)] |= 1<<(7-(x%8));
	pop	hl
	push	hl
	call	_pixpos
	ld	hl, #_buff
	ld	a, (hl)
	inc	hl
	add	a, e
	ld	c, a
	ld	a, (hl)
	adc	a, d
	ld	b, a
	ld	a, (bc)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	bc
	ld	de, #0x0008
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	pop	bc
	pop	hl
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
	or	a, l
	ld	(bc), a
;../../src/graphics.c:23: }
	ld	sp, ix
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
	ld	c, l
	ld	b, h
	ld	hl, #-19
	add	hl, sp
	ld	sp, hl
	ld	l,c
	ld	h,b
	ld	-6 (ix), e
	ld	-5 (ix), d
;../../src/graphics.c:48: int dx = absint(x1-x0), sx = x0<x1 ? 1 : -1;
	ld	a, 4 (ix)
	sub	a, c
	ld	e, a
	ld	a, 5 (ix)
	sbc	a, b
	ld	d, a
	push	bc
	ex	de, hl
	call	_absint
	pop	bc
	inc	sp
	inc	sp
	push	de
	ld	a, c
	sub	a, 4 (ix)
	ld	a, b
	sbc	a, 5 (ix)
	jp	PO, 00204$
	xor	a, #0x80
00204$:
	jp	P, 00125$
	ld	de, #0x0001
	jr	00126$
00125$:
	ld	de, #0xffff
00126$:
	ld	-8 (ix), e
	ld	-7 (ix), d
;../../src/graphics.c:49: int dy = absint(y1-y0), sy = (y0<y1 ? 1 : -1)*12, sy1 = (y0<y1 ? 1 : -1); 
	ld	a, 6 (ix)
	sub	a, -6 (ix)
	ld	e, a
	ld	a, 7 (ix)
	sbc	a, -5 (ix)
	ld	d, a
	push	bc
	ex	de, hl
	call	_absint
	pop	bc
	ld	-17 (ix), e
	ld	-16 (ix), d
	ld	a, -6 (ix)
	sub	a, 6 (ix)
	ld	a, -5 (ix)
	sbc	a, 7 (ix)
	jp	PO, 00205$
	xor	a, #0x80
00205$:
	rlca
	and	a,#0x01
	ld	e, a
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
	ld	-15 (ix), l
	ld	-14 (ix), h
	ld	a, e
	or	a, a
	jr	Z, 00129$
	ld	de, #0x0001
	jr	00130$
00129$:
	ld	de, #0xffff
00130$:
	ld	-13 (ix), e
	ld	-12 (ix), d
;../../src/graphics.c:50: int err = (dx>dy ? dx : -dy)/2, e2;
	ld	a, -17 (ix)
	sub	a, -19 (ix)
	ld	a, -16 (ix)
	sbc	a, -18 (ix)
	jp	PO, 00206$
	xor	a, #0x80
00206$:
	jp	P, 00131$
	pop	hl
	push	hl
	jr	00132$
00131$:
	xor	a, a
	sub	a, -17 (ix)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	sbc	a, a
	sub	a, -16 (ix)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
00132$:
	ld	e, l
	ld	d, h
	bit	7, h
	jr	Z, 00133$
	ex	de, hl
	inc	de
00133$:
	ld	-4 (ix), e
	ld	-3 (ix), d
	sra	-3 (ix)
	rr	-4 (ix)
;../../src/graphics.c:51: int pp = pixpos(x0, y0);
	push	bc
	ld	e, -6 (ix)
	ld	d, -5 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_pixpos
	pop	bc
	ld	-2 (ix), e
	ld	-1 (ix), d
;../../src/graphics.c:52: char pxor = 1<<(7-(x0%8));
	push	bc
	ld	de, #0x0008
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	pop	bc
	ld	a, #0x07
	sub	a, e
	ld	d, a
	ld	e, #0x01
	inc	d
	jr	00208$
00207$:
	sla	e
00208$:
	dec	d
	jr	NZ,00207$
	ld	a, -8 (ix)
	dec	a
	or	a, -7 (ix)
	ld	a, #0x01
	jr	Z, 00210$
	xor	a, a
00210$:
	ld	-11 (ix), a
	xor	a, a
	sub	a, -19 (ix)
	ld	-10 (ix), a
	sbc	a, a
	sub	a, -18 (ix)
	ld	-9 (ix), a
00121$:
;../../src/graphics.c:54: if (x0 < XMAX && y0 < YMAX )
	ld	a, c
	sub	a, #0x60
	ld	a, b
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00102$
	ld	a, -6 (ix)
	sub	a, #0x40
	ld	a, -5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	NC, 00102$
;../../src/graphics.c:55: buff[pp] |= pxor;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, -2 (ix)
	ld	-8 (ix), a
	inc	hl
	ld	a, (hl)
	adc	a, -1 (ix)
	ld	-7 (ix), a
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	a, (hl)
	or	a, e
	ld	l, -8 (ix)
	ld	h, -7 (ix)
	ld	(hl), a
00102$:
;../../src/graphics.c:56: if (x0==x1 && y0==y1) break;
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	cp	a, a
	sbc	hl, bc
	jr	NZ, 00105$
	ld	a, 6 (ix)
	sub	a, -6 (ix)
	jr	NZ, 00213$
	ld	a, 7 (ix)
	sub	a, -5 (ix)
	jp	Z,00123$
00213$:
00105$:
;../../src/graphics.c:57: e2 = err;
	ld	d, -4 (ix)
	ld	l, -3 (ix)
;	spillPairReg hl
;	spillPairReg hl
;../../src/graphics.c:58: if (e2 >-dx) { err -= dy; 
	ld	a, -10 (ix)
	sub	a, -4 (ix)
	ld	a, -9 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00214$
	xor	a, #0x80
00214$:
	jp	P, 00117$
	ld	a, -4 (ix)
	sub	a, -17 (ix)
	ld	-4 (ix), a
	ld	a, -3 (ix)
	sbc	a, -16 (ix)
	ld	-3 (ix), a
;../../src/graphics.c:59: if (sx == 1){
	ld	a, -11 (ix)
	or	a, a
	jr	Z, 00114$
;../../src/graphics.c:61: if (pxor != 1)
	ld	a, e
	dec	a
	jr	Z, 00108$
;../../src/graphics.c:62: pxor = pxor>>1;
	srl	e
	jr	00109$
00108$:
;../../src/graphics.c:64: pp+=1;
	inc	-2 (ix)
	jr	NZ, 00216$
	inc	-1 (ix)
00216$:
;../../src/graphics.c:65: pxor=128;
	ld	e, #0x80
00109$:
;../../src/graphics.c:67: x0+=1;
	inc	bc
	jr	00117$
00114$:
;../../src/graphics.c:70: x0-=1;
	dec	bc
;../../src/graphics.c:71: if (pxor != 128)
	ld	a, e
	sub	a, #0x80
	jr	Z, 00111$
;../../src/graphics.c:72: pxor = pxor<<1;
	sla	e
	jr	00117$
00111$:
;../../src/graphics.c:74: pp-=1;
	ld	a, -2 (ix)
	add	a, #0xff
	ld	-2 (ix), a
	ld	a, -1 (ix)
	adc	a, #0xff
	ld	-1 (ix), a
;../../src/graphics.c:75: pxor=1;
	ld	e, #0x01
00117$:
;../../src/graphics.c:79: if (e2 < dy) { err += dx; pp += sy;y0+=sy1; }
	ld	a, d
	sub	a, -17 (ix)
	ld	a, l
	sbc	a, -16 (ix)
	jp	PO, 00218$
	xor	a, #0x80
00218$:
	jp	P, 00121$
	ld	a, -4 (ix)
	add	a, -19 (ix)
	ld	-4 (ix), a
	ld	a, -3 (ix)
	adc	a, -18 (ix)
	ld	-3 (ix), a
	ld	a, -2 (ix)
	add	a, -15 (ix)
	ld	-2 (ix), a
	ld	a, -1 (ix)
	adc	a, -14 (ix)
	ld	-1 (ix), a
	ld	a, -6 (ix)
	add	a, -13 (ix)
	ld	-6 (ix), a
	ld	a, -5 (ix)
	adc	a, -12 (ix)
	ld	-5 (ix), a
	jp	00121$
00123$:
;../../src/graphics.c:81: }
	ld	sp, ix
	pop	ix
	pop	hl
	pop	af
	pop	af
	jp	(hl)
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
	inc	hl
	add	a, c
	ld	e, a
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
	inc	hl
	add	a, c
	ld	e, a
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
	ld	c, l
	ld	b, h
	ld	hl, #-27
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:96: if (x<0){
	bit	7, b
	jr	Z, 00113$
;../../src/graphics.c:97: x=0-x;
	xor	a, a
	sub	a, c
	ld	c, a
	sbc	a, a
	sub	a, b
	ld	b, a
;../../src/graphics.c:98: printc('-');
	push	bc
	ld	a, #0x2d
	call	_printc
	pop	bc
;../../src/graphics.c:101: do {
00113$:
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00103$:
;../../src/graphics.c:102: out[i]=x % 10 + '0';
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	hl, #0
	add	hl, sp
	add	hl, de
	push	hl
	push	bc
	ld	de, #0x000a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__modsint
	pop	bc
	pop	hl
	ld	a, e
	add	a, #0x30
	ld	(hl), a
;../../src/graphics.c:103: i+=1;
	inc	-2 (ix)
	jr	NZ, 00139$
	inc	-1 (ix)
00139$:
;../../src/graphics.c:104: } while((x /= 10) > 0);
	ld	de, #0x000a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	__divsint
	ld	c, e
	ld	b, d
	xor	a, a
	cp	a, e
	sbc	a, d
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	M, 00103$
;../../src/graphics.c:105: i--;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	dec	bc
00108$:
;../../src/graphics.c:106: for(;i>=0; i--){
	bit	7, b
	jr	NZ, 00110$
;../../src/graphics.c:107: printc(out[i]);
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	e, (hl)
	push	bc
	ld	a, e
	call	_printc
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
	ld	c, l
	ld	b, h
	ld	hl, #-31
	add	hl, sp
	ld	sp, hl
	ld	l, c
	ld	h, b
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
;../../src/graphics.c:115: do {
	ld	bc, #0x0000
00101$:
;../../src/graphics.c:116: out[i]=x % 10 + '0';
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	-6 (ix), l
	ld	-5 (ix), h
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__modulong
	pop	af
	pop	af
	pop	bc
	ld	a, e
	add	a, #0x30
	ld	l, -6 (ix)
	ld	h, -5 (ix)
	ld	(hl), a
;../../src/graphics.c:117: i+=1;
	inc	bc
;../../src/graphics.c:118: } while((x /= 10) > 0);
	push	bc
	ld	hl, #0x0000
	push	hl
	ld	l, #0x0a
	push	hl
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	ld	l, -2 (ix)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, -1 (ix)
;	spillPairReg hl
;	spillPairReg hl
	call	__divulong
	pop	af
	pop	af
	pop	bc
	ld	-4 (ix), e
	ld	-3 (ix), d
	ld	-2 (ix), l
	ld	-1 (ix), h
	ld	a, h
	or	a, l
	or	a, d
	or	a, e
	jr	NZ, 00101$
;../../src/graphics.c:119: i--;
	dec	bc
00106$:
;../../src/graphics.c:120: for(;i>=0; i--){
	bit	7, b
	jr	NZ, 00108$
;../../src/graphics.c:121: printc(out[i]);
	ld	hl, #0
	add	hl, sp
	add	hl, bc
	ld	e, (hl)
	push	bc
	ld	a, e
	call	_printc
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
	ld	a, (#0x843f)
	ld	e, a
	ld	d, #0x00
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
;../../src/graphics.c:272: void resetRandomSeed(){
;	---------------------------------
; Function resetRandomSeed
; ---------------------------------
_resetRandomSeed::
;../../src/graphics.c:273: bcall(0x4B7F);
	rst	40 
	.dw 0x4B7F 
;../../src/graphics.c:274: }
	ret
;../../src/graphics.c:275: int randomInt(){
;	---------------------------------
; Function randomInt
; ---------------------------------
_randomInt::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
;../../src/graphics.c:276: int x = 0;
	ld	hl, #0x0000
	ex	(sp), hl
;../../src/graphics.c:277: bcall(0x4B79);
	rst	40 
	.dw 0x4B79 
;../../src/graphics.c:278: assignAToVar(&x);
	ld	hl, #0
	add	hl, sp
	call	_assignAToVar
;../../src/graphics.c:279: return x;
	pop	de
	push	de
;../../src/graphics.c:280: }
	ld	sp, ix
	pop	ix
	ret
;../../src/raw_display.c:3: void set_lcd(char col, char row, char data){
;	---------------------------------
; Function set_lcd
; ---------------------------------
_set_lcd::
	push	ix
	ld	ix,#0
	add	ix,sp
;../../src/raw_display.c:30: __endasm;
	ld	a, 4 (ix)
	add	a, #0x20
	out	(#0x10), a
	ex	(sp),hl ;19
	ex	(sp),hl ;38
	inc	(hl) ;49
	dec	(hl) ;60
	ld	a, 5 (ix)
	add	a, #0x20
	ld	a, #0x80
	out	(#0x10), a
	ex	(sp),hl ;19
	ex	(sp),hl ;38
	inc	(hl) ;49
	dec	(hl) ;60
	ld	a, 6 (ix)
	out	(#0x11), a
;../../src/raw_display.c:31: }
	pop	ix
	pop	hl
	inc	sp
	jp	(hl)
;../../src/raw_display.c:95: void lwait(){
;	---------------------------------
; Function lwait
; ---------------------------------
_lwait::
;../../src/raw_display.c:101: __endasm;
	    lcd_busy_loop:
	in	a,(#0x10)
	rla
	jr	c,lcd_busy_loop
;../../src/raw_display.c:102: }
	ret
;../../src/raw_display.c:103: void fast_fill(){
;	---------------------------------
; Function fast_fill
; ---------------------------------
_fast_fill::
;../../src/raw_display.c:104: for (char  c = 0x20; c < 0x3F; ++c){
	ld	c, #0x20
00107$:
	ld	a, c
	sub	a, #0x3f
	jr	NC, 00102$
;../../src/raw_display.c:105: for (char  r = 0x80; r < 0xBF; ++r){
	ld	b, #0x80
00104$:
	ld	a, b
	sub	a, #0xbf
	jr	NC, 00108$
;../../src/raw_display.c:118: __endasm;
	ld	d, a
	out	(#0x10), a
	ex	(sp),hl ;19
	ex	(sp),hl ;38
	inc	(hl) ;49
	dec	(hl) ;60
	ld	a, c
	out	(#0x10), a
;../../src/raw_display.c:119: lwait();
	push	bc
	call	_lwait
	pop	bc
;../../src/raw_display.c:126: __endasm;
	ld	a, #0xFF
	out	(#0x11), a
	ld	a, d
;../../src/raw_display.c:105: for (char  r = 0x80; r < 0xBF; ++r){
	inc	b
	jr	00104$
00108$:
;../../src/raw_display.c:104: for (char  c = 0x20; c < 0x3F; ++c){
	inc	c
	jr	00107$
00102$:
;../../src/raw_display.c:132: __endasm;
	ld	a, #0x00
	out	(#0x11), a
;../../src/raw_display.c:133: }
	ret
;main.c:35: void paddle(int x, int y){
;	---------------------------------
; Function paddle
; ---------------------------------
_paddle::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	ld	-2 (ix), e
	ld	-1 (ix), d
;main.c:36: line(x, y, x+paddle_width, y);
	ld	c, l
	ld	b, h
	inc	bc
	inc	bc
	push	hl
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	push	de
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	call	_line
	pop	bc
	pop	hl
;main.c:37: line(x, y+paddle_len, x+paddle_width, y+paddle_len);
	ld	a, -2 (ix)
	add	a, #0x0f
	ld	-4 (ix), a
	ld	a, -1 (ix)
	adc	a, #0x00
	ld	-3 (ix), a
	push	hl
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	push	de
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	call	_line
	pop	bc
	pop	hl
;main.c:39: line(x, y, x, y+paddle_len);
	push	bc
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	push	de
	push	hl
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	call	_line
	pop	bc
;main.c:40: line(x+paddle_width, y, x+paddle_width, y+paddle_len);
	pop	hl
	push	hl
	push	hl
	push	bc
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	call	_line
;main.c:41: }
	ld	sp, ix
	pop	ix
	ret
;main.c:77: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:78: clearscreen();
	call	_clearscreen
;main.c:79: init_graphics();
	call	_init_graphics
;main.c:84: resetcursor();
	call	_resetcursor
;main.c:85: badclr();
	call	_badclr
;main.c:89: bb();
	call	_bb
;main.c:90: getKey();
;main.c:145: }
	jp	_getKey
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
