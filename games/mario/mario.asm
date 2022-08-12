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
	.globl _isgrounded
	.globl _drawbitmap
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _wait128
	.globl _numberslong
	.globl _number
	.globl _badfill
	.globl _badclr
	.globl _vline
	.globl _hline
	.globl _setpix
	.globl _pixpos
	.globl _printc
	.globl ___cio__current_line
	.globl _Vtrack
	.globl _py
	.globl _px
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
_px::
	.ds 2
_py::
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
;../../src/graphics.c:25: void hline(int x, int y, int ln){
;	---------------------------------
; Function hline
; ---------------------------------
_hline::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-7
	add	hl, sp
	ld	sp, hl
;../../src/graphics.c:26: int pp = y*12;
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ex	(sp), hl
;../../src/graphics.c:27: for (int x2=x; x2 <x+ln; x2+=1){
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	ld	a, c
	add	a, 8 (ix)
	ld	-5 (ix), a
	ld	a, b
	adc	a, 9 (ix)
	ld	-4 (ix), a
00105$:
	ld	a, c
	sub	a, -5 (ix)
	ld	a, b
	sbc	a, -4 (ix)
	jp	PO, 00131$
	xor	a, #0x80
00131$:
	jp	P, 00107$
;../../src/graphics.c:28: int temp = pp+(x2/8);
	ld	l, c
	ld	h, b
	bit	7, b
	jr	Z,00109$
	ld	hl, #0x0007
	add	hl, bc
00109$:
	sra	h
	rr	l
	sra	h
	rr	l
	sra	h
	rr	l
	pop	de
	push	de
	add	hl, de
	ex	de,hl
;../../src/graphics.c:29: if (!IFMAXBYTE(temp))
	xor	a, a
	cp	a, e
	ld	a, #0x03
	sbc	a, d
	jp	PO, 00132$
	xor	a, #0x80
00132$:
	jp	M, 00106$
;../../src/graphics.c:30: buff[temp] |= 1<<(7-(x2%8));
	ld	hl, #_buff
	ld	a, (hl)
	add	a, e
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, d
	ld	d, a
	ld	a, (de)
	ld	-3 (ix), a
	push	bc
	push	de
	ld	hl, #0x0008
	push	hl
	push	bc
	call	__modsint
	pop	af
	pop	af
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
	ld	l, -2 (ix)
	ld	a, #0x07
	sub	a, l
	ld	l, a
	ld	h, #0x01
	inc	l
	jr	00134$
00133$:
	sla	h
00134$:
	dec	l
	jr	NZ,00133$
	ld	a, -3 (ix)
	or	a, h
	ld	(de), a
00106$:
;../../src/graphics.c:27: for (int x2=x; x2 <x+ln; x2+=1){
	inc	bc
	jr	00105$
00107$:
;../../src/graphics.c:32: }
	ld	sp, ix
	pop	ix
	ret
;../../src/graphics.c:33: void vline(int x, int y, int ln){
;	---------------------------------
; Function vline
; ---------------------------------
_vline::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
	dec	sp
;../../src/graphics.c:34: int pc = 1<<(7-(x%8));
	ld	hl, #0x0008
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	ld	a, #0x07
	sub	a, c
	ld	-5 (ix), #0x01
	inc	a
	jr	00139$
00138$:
	sla	-5 (ix)
00139$:
	dec	a
	jr	NZ,00138$
;../../src/graphics.c:35: if (XMAX > x ){
	ld	a, 4 (ix)
	sub	a, #0x60
	ld	a, 5 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00109$
;../../src/graphics.c:36: int xc = (x/8);
	ld	e, 4 (ix)
	ld	d, 5 (ix)
	bit	7, d
	jr	Z,00111$
	ld	hl, #0x0007
	add	hl, de
	ex	de, hl
00111$:
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;../../src/graphics.c:37: for (int y2 = y; y2<y+ln; y2++){
	ld	c, 6 (ix)
	ld	b, 7 (ix)
	ld	a, c
	add	a, 8 (ix)
	ld	-4 (ix), a
	ld	a, b
	adc	a, 9 (ix)
	ld	-3 (ix), a
	ld	-2 (ix), c
	ld	-1 (ix), b
00107$:
	ld	a, -2 (ix)
	sub	a, -4 (ix)
	ld	a, -1 (ix)
	sbc	a, -3 (ix)
	jp	PO, 00140$
	xor	a, #0x80
00140$:
	jp	P, 00109$
;../../src/graphics.c:38: int temp = (y2*12)+xc;
	ld	c, -2 (ix)
	ld	b, -1 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	add	hl, de
	ld	c, l
	ld	b, h
;../../src/graphics.c:39: if (!IFMAXBYTE(temp))
	xor	a, a
	cp	a, c
	ld	a, #0x03
	sbc	a, b
	jp	PO, 00141$
	xor	a, #0x80
00141$:
	jp	M, 00108$
;../../src/graphics.c:40: buff[temp] |= pc;   
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	b, a
	ld	a, (bc)
	or	a, -5 (ix)
	ld	(bc), a
00108$:
;../../src/graphics.c:37: for (int y2 = y; y2<y+ln; y2++){
	inc	-2 (ix)
	jr	NZ,00107$
	inc	-1 (ix)
	jr	00107$
00109$:
;../../src/graphics.c:42: }}
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
;../../src/graphics.c:178: int x = (int)(*((char*)(0x843F)));
	ld	hl, #0x843f
	ld	l, (hl)
	ld	h, #0x00
;../../src/graphics.c:180: return x;}
	ret
;../../src/graphics.c:186: void init_graphics(){
;	---------------------------------
; Function init_graphics
; ---------------------------------
_init_graphics::
;../../src/graphics.c:187: buff = (char*)(SCREEN_BUFFER);
	ld	hl, #_buff
	ld	(hl), #0x40
	inc	hl
	ld	(hl), #0x93
;../../src/graphics.c:188: }
	ret
;main.c:35: void drawbitmap(int x, int y, int height, int width, char* img){
;	---------------------------------
; Function drawbitmap
; ---------------------------------
_drawbitmap::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-22
	add	hl, sp
	ld	sp, hl
;main.c:36: for (int py =0; py<height; py++){
	ld	hl, #0x0008
	push	hl
	ld	l, 4 (ix)
	ld	h, 5 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	-22 (ix), l
	ld	-21 (ix), h
	xor	a, a
	ld	-5 (ix), a
	ld	-4 (ix), a
00122$:
	ld	a, -5 (ix)
	sub	a, 8 (ix)
	ld	a, -4 (ix)
	sbc	a, 9 (ix)
	jp	PO, 00202$
	xor	a, #0x80
00202$:
	jp	P, 00124$
;main.c:37: for (int px = 0; px<width; px++){
	ld	l, 10 (ix)
	ld	h, 11 (ix)
	push	hl
	ld	l, -5 (ix)
	ld	h, -4 (ix)
	push	hl
	call	__mulint
	pop	af
	pop	af
	ld	-20 (ix), l
	ld	-19 (ix), h
	ld	a, -5 (ix)
	add	a, 6 (ix)
	ld	-18 (ix), a
	ld	a, -4 (ix)
	adc	a, 7 (ix)
	ld	-17 (ix), a
	ld	a, -18 (ix)
	sub	a, #0x40
	ld	a, -17 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	ld	a, #0x00
	rla
	ld	-16 (ix), a
	xor	a, a
	ld	-3 (ix), a
	ld	-2 (ix), a
00119$:
	ld	a, -3 (ix)
	sub	a, 10 (ix)
	ld	a, -2 (ix)
	sbc	a, 11 (ix)
	jp	PO, 00203$
	xor	a, #0x80
00203$:
	jp	P, 00123$
;main.c:38: if((py+y)<YMAX){
	ld	a, -16 (ix)
	or	a, a
	jp	Z, 00120$
;main.c:39: char pixbyte = img[px+(py*width)];
	ld	a, -3 (ix)
	add	a, -20 (ix)
	ld	c, a
	ld	a, -2 (ix)
	adc	a, -19 (ix)
	ld	b, a
	ld	a, c
	add	a, 12 (ix)
	ld	c, a
	ld	a, b
	adc	a, 13 (ix)
	ld	b, a
	ld	a, (bc)
	ld	-15 (ix), a
;main.c:40: int tempY = ((py+y)*12);
	ld	c, -18 (ix)
	ld	b, -17 (ix)
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	-14 (ix), l
	ld	-13 (ix), h
;main.c:41: if (x%8==0){
	ld	a, -21 (ix)
	or	a, -22 (ix)
	jr	NZ,00140$
;main.c:42: int pxb = px+(x/8);
	ld	a, 4 (ix)
	ld	-7 (ix), a
	ld	a, 5 (ix)
	ld	-6 (ix), a
	bit	7, -6 (ix)
	jr	Z,00126$
	ld	a, -7 (ix)
	add	a, #0x07
	ld	-7 (ix), a
	jr	NC,00204$
	inc	-6 (ix)
00204$:
00126$:
	ld	c, -7 (ix)
	ld	b, -6 (ix)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	l, -3 (ix)
	ld	h, -2 (ix)
	add	hl, bc
;main.c:43: if (pxb<12)
	ld	a, l
	sub	a, #0x0c
	ld	a, h
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00120$
;main.c:44: buff[tempY+pxb] = pixbyte;
	ld	a, -14 (ix)
	add	a, l
	ld	c, a
	ld	a, -13 (ix)
	adc	a, h
	ld	b, a
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	b, a
	ld	a, -15 (ix)
	ld	(bc), a
	jp	00120$
;main.c:46: for (char bp = 0; bp < 8; bp++){
00140$:
	ld	e, -3 (ix)
	ld	d, -2 (ix)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	xor	a, a
	ld	-1 (ix), a
00116$:
	ld	a, -1 (ix)
	sub	a, #0x08
	jp	NC, 00120$
;main.c:47: if (IS_BIT_SET(pixbyte, (7-bp))){
	ld	a, #0x07
	sub	a, -1 (ix)
	ld	b, a
	ld	hl, #0x0001
	inc	b
	jr	00208$
00207$:
	add	hl, hl
00208$:
	djnz	00207$
	ld	c, -15 (ix)
	ld	b, #0x00
	ld	a, l
	and	a, c
	ld	c, a
	ld	a, h
	and	a, b
	or	a, c
	jp	Z, 00117$
;main.c:48: int rx = bp+x+(px*8);
	ld	a, -1 (ix)
	ld	b, #0x00
	add	a, 4 (ix)
	ld	c, a
	ld	a, b
	adc	a, 5 (ix)
	ld	b, a
	ld	l, c
	ld	h, b
	add	hl, de
	ld	-12 (ix), l
	ld	-11 (ix), h
;main.c:49: if (rx<XMAX)
	ld	a, -12 (ix)
	sub	a, #0x60
	ld	a, -11 (ix)
	rla
	ccf
	rra
	sbc	a, #0x80
	jp	NC, 00117$
;main.c:50: buff[(rx/8) + tempY] |= 1<<(7-(rx%8));
	ld	c, -12 (ix)
	ld	b, -11 (ix)
	ld	a, -11 (ix)
	rlca
	and	a,#0x01
	ld	-10 (ix), a
	ld	a, -12 (ix)
	add	a, #0x07
	ld	-9 (ix), a
	ld	a, -11 (ix)
	adc	a, #0x00
	ld	-8 (ix), a
	ld	a, -10 (ix)
	or	a, a
	jr	Z,00127$
	ld	c, -9 (ix)
	ld	b, -8 (ix)
00127$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	add	a, -14 (ix)
	ld	c, a
	ld	a, b
	adc	a, -13 (ix)
	ld	b, a
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	-7 (ix), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	-6 (ix), a
	ld	c, -12 (ix)
	ld	b, -11 (ix)
	ld	a, -10 (ix)
	or	a, a
	jr	Z,00128$
	ld	c, -9 (ix)
	ld	b, -8 (ix)
00128$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	add	a, -14 (ix)
	ld	c, a
	ld	a, b
	adc	a, -13 (ix)
	ld	b, a
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	c, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	b, a
	ld	a, (bc)
	ld	-8 (ix), a
	push	de
	ld	hl, #0x0008
	push	hl
	ld	l, -12 (ix)
	ld	h, -11 (ix)
	push	hl
	call	__modsint
	pop	af
	pop	af
	ld	c, l
	pop	de
	ld	a, #0x07
	sub	a, c
	ld	c, a
	ld	l, #0x01
	inc	c
	jr	00210$
00209$:
	sla	l
00210$:
	dec	c
	jr	NZ,00209$
	ld	a, -8 (ix)
	or	a, l
	ld	l, -7 (ix)
	ld	h, -6 (ix)
	ld	(hl), a
00117$:
;main.c:46: for (char bp = 0; bp < 8; bp++){
	inc	-1 (ix)
	jp	00116$
00120$:
;main.c:37: for (int px = 0; px<width; px++){
	inc	-3 (ix)
	jp	NZ,00119$
	inc	-2 (ix)
	jp	00119$
00123$:
;main.c:36: for (int py =0; py<height; py++){
	inc	-5 (ix)
	jp	NZ,00122$
	inc	-4 (ix)
	jp	00122$
00124$:
;main.c:59: }
	ld	sp, ix
	pop	ix
	ret
;main.c:61: bool isgrounded(){
;	---------------------------------
; Function isgrounded
; ---------------------------------
_isgrounded::
;main.c:63: return py > YMAX-9;
	ld	a, #0x37
	ld	hl, #_py
	cp	a, (hl)
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	jp	PO, 00103$
	xor	a, #0x80
00103$:
	rlca
	and	a,#0x01
	ld	l, a
;main.c:64: }
	ret
;main.c:69: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl, #-89
	add	hl, sp
	ld	sp, hl
;imgs.c:1: const char sp1[] = {0x07, 0xc7, 0x00,
	ld	hl, #0
	add	hl, sp
	ex	de, hl
	ld	a, #0x07
	ld	(de), a
	ld	l, e
	ld	h, d
	inc	hl
	ld	(hl), #0xc7
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	xor	a, a
	ld	(bc), a
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x08
	ld	hl, #0x0004
	add	hl, de
	ld	(hl), #0x38
	ld	hl, #0x0005
	add	hl, de
	ld	(hl), #0x80
	ld	hl, #0x0006
	add	hl, de
	ld	(hl), #0x10
	ld	hl, #0x0007
	add	hl, de
	ld	(hl), #0x04
	ld	hl, #0x0008
	add	hl, de
	ld	(hl), #0x80
	ld	hl, #0x0009
	add	hl, de
	ld	(hl), #0x1c
	ld	hl, #0x000a
	add	hl, de
	ld	(hl), #0xbd
	ld	hl, #0x000b
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x000c
	add	hl, de
	ld	(hl), #0x26
	ld	hl, #0x000d
	add	hl, de
	ld	(hl), #0x81
	ld	hl, #0x000e
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x000f
	add	hl, de
	ld	(hl), #0x26
	ld	hl, #0x0010
	add	hl, de
	ld	(hl), #0x41
	ld	hl, #0x0011
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0012
	add	hl, de
	ld	(hl), #0x18
	ld	hl, #0x0013
	add	hl, de
	ld	(hl), #0xfe
	ld	hl, #0x0014
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0015
	add	hl, de
	ld	(hl), #0x0c
	ld	hl, #0x0016
	add	hl, de
	ld	(hl), #0x02
	ld	hl, #0x0017
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0018
	add	hl, de
	ld	(hl), #0x22
	ld	hl, #0x0019
	add	hl, de
	ld	(hl), #0x34
	ld	hl, #0x001a
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x001b
	add	hl, de
	ld	(hl), #0x71
	ld	hl, #0x001c
	add	hl, de
	ld	(hl), #0x0f
	ld	hl, #0x001d
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x001e
	add	hl, de
	ld	(hl), #0x89
	ld	hl, #0x001f
	add	hl, de
	ld	(hl), #0x74
	ld	hl, #0x0020
	add	hl, de
	ld	(hl), #0x80
	ld	hl, #0x0021
	add	hl, de
	ld	(hl), #0x8b
	ld	hl, #0x0022
	add	hl, de
	ld	(hl), #0xfc
	ld	hl, #0x0023
	add	hl, de
	ld	(hl), #0x80
	ld	hl, #0x0024
	add	hl, de
	ld	(hl), #0x5f
	ld	hl, #0x0025
	add	hl, de
	ld	(hl), #0xf9
	ld	hl, #0x0026
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x0027
	add	hl, de
	ld	(hl), #0x8f
	ld	hl, #0x0028
	add	hl, de
	ld	(hl), #0xf9
	ld	hl, #0x0029
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x002a
	add	hl, de
	ld	(hl), #0x9f
	ld	hl, #0x002b
	add	hl, de
	ld	(hl), #0x86
	ld	hl, #0x002c
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x002d
	add	hl, de
	ld	(hl), #0x6e
	ld	hl, #0x002e
	add	hl, de
	ld	(hl), #0x00
	ld	hl, #0x002f
	add	hl, de
	ld	(hl), #0x00
;imgs.c:19: const char sp2[] = {0x0f, 0x80,
	ld	hl, #48
	add	hl, sp
	ld	c,l
	ld	b,h
	ld	(hl),#0x0f
	ld	l, c
	ld	h, b
	inc	hl
	ld	(hl), #0x80
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	(hl), #0x0f
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), #0x80
	ld	hl, #0x0004
	add	hl, bc
	ld	(hl), #0x1f
	ld	hl, #0x0005
	add	hl, bc
	ld	(hl), #0xf8
	ld	hl, #0x0006
	add	hl, bc
	ld	(hl), #0x7c
	ld	hl, #0x0007
	add	hl, bc
	ld	(hl), #0x40
	ld	hl, #0x0008
	add	hl, bc
	ld	(hl), #0x7c
	ld	hl, #0x0009
	add	hl, bc
	ld	(hl), #0x40
	ld	hl, #0x000a
	add	hl, bc
	ld	(hl), #0xee
	ld	hl, #0x000b
	add	hl, bc
	ld	(hl), #0x00
	ld	hl, #0x000c
	add	hl, bc
	ld	(hl), #0xe0
	ld	hl, #0x000d
	add	hl, bc
	ld	(hl), #0x70
	ld	hl, #0x000e
	add	hl, bc
	ld	(hl), #0xe0
	ld	hl, #0x000f
	add	hl, bc
	ld	(hl), #0x70
	ld	hl, #0x0010
	add	hl, bc
	ld	(hl), #0x00
	ld	hl, #0x0011
	add	hl, bc
	ld	(hl), #0x00
	ld	hl, #0x0012
	add	hl, bc
	ld	(hl), #0x73
	ld	hl, #0x0013
	add	hl, bc
	ld	(hl), #0x80
	ld	hl, #0x0014
	add	hl, bc
	ld	(hl), #0x73
	ld	hl, #0x0015
	add	hl, bc
	ld	(hl), #0x80
	ld	hl, #0x0016
	add	hl, bc
	ld	(hl), #0xf3
	ld	hl, #0x0017
	add	hl, bc
	ld	(hl), #0xb8
	ld	hl, #0x0018
	add	hl, bc
	ld	(hl), #0x1f
	ld	hl, #0x0019
	add	hl, bc
	ld	(hl), #0xf8
	ld	hl, #0x001a
	add	hl, bc
	ld	(hl), #0x1f
	ld	hl, #0x001b
	add	hl, bc
	ld	(hl), #0xf8
	ld	hl, #0x001c
	add	hl, bc
	ld	(hl), #0x07
	ld	hl, #0x001d
	add	hl, bc
	ld	(hl), #0xc0
	ld	hl, #0x001e
	add	hl, bc
	ld	(hl), #0x1c
	ld	hl, #0x001f
	add	hl, bc
	ld	(hl), #0x70
	ld	hl, #0x0020
	add	hl, bc
	ld	(hl), #0x1c
	ld	hl, #0x0021
	add	hl, bc
	ld	(hl), #0x70
	ld	hl, #0x0022
	add	hl, bc
	ld	(hl), #0x7c
	ld	hl, #0x0023
	add	hl, bc
	ld	(hl), #0x78
;main.c:72: px = XMAX/2;
	ld	hl, #_px
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x00
;main.c:73: py = 4;
	ld	hl, #_py
	ld	(hl), #0x04
	inc	hl
	ld	(hl), #0x00
;main.c:75: int xvol=0;
	ld	bc, #0x0000
;main.c:76: int yvol=0;
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
;main.c:77: bool update = true;
	ld	-5 (ix), #0x01
;main.c:78: init_graphics();
	push	bc
	push	de
	call	_init_graphics
	pop	de
	pop	bc
;main.c:81: Vtrack = VARBIN;
	ld	hl, #_Vtrack
	ld	(hl), #0x72
	inc	hl
	ld	(hl), #0x98
;main.c:83: clearscreen();
	push	bc
	push	de
	call	_clearscreen
	pop	de
	pop	bc
;main.c:84: while (true){
	ld	-4 (ix), e
	ld	-3 (ix), d
00144$:
;main.c:85: int x = getKeyId();
	push	bc
	call	_getKeyId
	ex	de,hl
	pop	bc
;main.c:87: if (x !=0){
	ld	a, d
	or	a, e
	jr	Z,00115$
;main.c:88: setPenCol(0);
	push	bc
	push	de
	xor	a, a
	push	af
	inc	sp
	call	_setPenCol
	inc	sp
	pop	de
	pop	bc
;main.c:89: if (x == 15)
	ld	a, e
	sub	a, #0x0f
	or	a, d
	jp	Z,00146$
;main.c:91: else if (x == 2){
	ld	a, e
	sub	a, #0x02
	or	a, d
	jr	NZ,00109$
;main.c:92: px -=XSPEED;
	ld	hl, #_px
	ld	a, (hl)
	add	a, #0xf8
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0xff
	ld	(hl), a
	jr	00113$
00109$:
;main.c:94: else if (x == 3){
	ld	a, e
	sub	a, #0x03
	or	a, d
	jr	NZ,00106$
;main.c:95: px +=XSPEED;
	ld	hl, #_px
	ld	a, (hl)
	add	a, #0x08
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
	jr	00113$
00106$:
;main.c:97: else if (x == 4){
	ld	a, e
	sub	a, #0x04
	or	a, d
	jr	NZ,00113$
;main.c:98: if (isgrounded())
	push	bc
	call	_isgrounded
	ld	a, l
	pop	bc
	bit	0, a
	jp	NZ, 00146$
;main.c:99: break;
00113$:
;main.c:101: update = true;
	ld	-5 (ix), #0x01
00115$:
;main.c:103: if (xvol !=0 | yvol != 0){
	ld	a, b
	or	a, c
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	ld	e, a
	ld	a, -1 (ix)
	or	a, -2 (ix)
	sub	a,#0x01
	ld	a, #0x00
	rla
	xor	a, #0x01
	or	a, e
	bit	0, a
	jp	Z, 00127$
;main.c:104: px += xvol;
	ld	hl, #_px
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;main.c:105: py += yvol;
	ld	hl, #_py
	ld	a, (hl)
	add	a, -2 (ix)
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, -1 (ix)
	ld	(hl), a
;main.c:106: xvol = xvol - xvol/4;
	ld	e, c
	ld	d, b
	bit	7, b
	jr	Z,00148$
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
00148$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
;main.c:107: if (xvol > 0)
	xor	a, a
	cp	a, c
	sbc	a, b
	jp	PO, 00257$
	xor	a, #0x80
00257$:
	jp	P, 00119$
;main.c:108: xvol -=1;
	dec	bc
	jr	00120$
00119$:
;main.c:109: else if (xvol < 0)
	bit	7, b
	jr	Z,00120$
;main.c:110: xvol +=1;
	inc	bc
00120$:
;main.c:111: if (yvol > 0)
	xor	a, a
	cp	a, -2 (ix)
	sbc	a, -1 (ix)
	jp	PO, 00258$
	xor	a, #0x80
00258$:
	jp	P, 00124$
;main.c:112: yvol -=1;
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	dec	hl
	ld	-2 (ix), l
	ld	-1 (ix), h
	jr	00125$
00124$:
;main.c:113: else if (yvol < 0)
	bit	7, -1 (ix)
	jr	Z,00125$
;main.c:114: yvol +=1;
	inc	-2 (ix)
	jr	NZ,00259$
	inc	-1 (ix)
00259$:
00125$:
;main.c:115: yvol = yvol - yvol/4;
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	bit	7, -1 (ix)
	jr	Z,00149$
	ld	e, -2 (ix)
	ld	d, -1 (ix)
	inc	de
	inc	de
	inc	de
00149$:
	sra	d
	rr	e
	sra	d
	rr	e
	ld	a, -2 (ix)
	sub	a, e
	ld	-2 (ix), a
	ld	a, -1 (ix)
	sbc	a, d
	ld	-1 (ix), a
;main.c:116: update = true;
	ld	-5 (ix), #0x01
00127$:
;main.c:118: if (!isgrounded()){
	push	bc
	call	_isgrounded
	ld	a, l
	pop	bc
	bit	0, a
	jr	NZ,00131$
;main.c:119: yvol +=FALL_SPEED;
	ld	a, -2 (ix)
	add	a, #0x04
	ld	-2 (ix), a
	jr	NC,00260$
	inc	-1 (ix)
00260$:
;main.c:120: if (yvol > FALL_SPEED*4){
	ld	a, #0x10
	cp	a, -2 (ix)
	ld	a, #0x00
	sbc	a, -1 (ix)
	jp	PO, 00261$
	xor	a, #0x80
00261$:
	jp	P, 00132$
;main.c:121: yvol = FALL_SPEED*4;
	ld	-2 (ix), #0x10
	xor	a, a
	ld	-1 (ix), a
	jr	00132$
00131$:
;main.c:124: yvol = 0;
	xor	a, a
	ld	-2 (ix), a
	ld	-1 (ix), a
00132$:
;main.c:126: if (px < 0){
	ld	hl, #_px + 1
	bit	7, (hl)
	jr	Z,00134$
;main.c:127: px = 0;
	dec	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
00134$:
;main.c:129: if (py < 0){
	ld	hl, #_py + 1
	bit	7, (hl)
	jr	Z,00136$
;main.c:130: py = 0;
	dec	hl
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
00136$:
;main.c:132: if (py > YMAX-16){
	ld	a, #0x30
	ld	hl, #_py
	cp	a, (hl)
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	jp	PO, 00262$
	xor	a, #0x80
00262$:
	jp	P, 00138$
;main.c:133: py = YMAX-16;
	ld	hl, #_py
	ld	(hl), #0x30
	inc	hl
	ld	(hl), #0x00
00138$:
;main.c:135: if (px > XMAX){
	ld	a, #0x60
	ld	hl, #_px
	cp	a, (hl)
	ld	a, #0x00
	inc	hl
	sbc	a, (hl)
	jp	PO, 00263$
	xor	a, #0x80
00263$:
	jp	P, 00140$
;main.c:136: px = XMAX;
	ld	hl, #_px
	ld	(hl), #0x60
	inc	hl
	ld	(hl), #0x00
00140$:
;main.c:140: if (update){
	bit	0, -5 (ix)
	jp	Z, 00144$
;main.c:141: badclr();
	push	bc
	call	_badclr
	pop	bc
;main.c:142: drawbitmap(px, py, 16, 3, sp1);
	ld	e, -4 (ix)
	ld	d, -3 (ix)
	push	bc
	push	de
	ld	hl, #0x0003
	push	hl
	ld	l, #0x10
	push	hl
	ld	hl, (_py)
	push	hl
	ld	hl, (_px)
	push	hl
	call	_drawbitmap
	ld	hl, #10
	add	hl, sp
	ld	sp, hl
	call	_swap
	pop	bc
	jp	00144$
00146$:
;main.c:156: }
	ld	sp, ix
	pop	ix
	ret
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
	.area _CABS (ABS)
