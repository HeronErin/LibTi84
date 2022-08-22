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
	.globl _run
	.globl _loadNode
	.globl _getByte
	.globl _getBit
	.globl _lind
	.globl _imgind
	.globl _init_graphics
	.globl _getKeyId
	.globl _swap
	.globl _wait128
	.globl _badfill
	.globl _badclr
	.globl _setpix
	.globl _pixpos
	.globl _lens
	.globl _img
	.globl ___cio__current_line
	.globl _bitc
	.globl _curr
	.globl _boff
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
_boff::
	.ds 2
_curr::
	.ds 2
_bitc::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
___cio__current_line::
	.ds 1
_img::
	.ds 1251
_lens::
	.ds 32
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
;main.c:54: char imgind(int x){
;	---------------------------------
; Function imgind
; ---------------------------------
_imgind::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:66: __endasm;
	ld	a, #<(__xinit__img)
	add	a, 4 (ix)
	ld	c, a
	ld	a, #>(__xinit__img)
	adc	a, 5 (ix)
	ld	l, c
	ld	h, a
	ld	l, (hl)
;main.c:67: }
	pop	ix
	ret
;main.c:71: int lind(int x){
;	---------------------------------
; Function lind
; ---------------------------------
_lind::
	push	ix
	ld	ix,#0
	add	ix,sp
;main.c:84: __endasm;
	ld	c, 4 (ix)
	ld	b, 5 (ix)
	sla	c
	rl	b
	ld	hl, #__xinit__lens
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, c
;main.c:85: }
	pop	ix
	ret
;huffman.c:11: char getBit(){
;	---------------------------------
; Function getBit
; ---------------------------------
_getBit::
;huffman.c:12: char r = BIT(imgind(bitc/8 + boff), 7-(bitc%8));
	ld	bc, (_bitc)
	srl	b
	rr	c
	srl	b
	rr	c
	srl	b
	rr	c
	ld	de, (_boff)
	ex	de,hl
	add	hl, bc
	push	hl
	call	_imgind
	pop	af
	ld	c, l
	ld	a, (#_bitc)
	and	a, #0x07
	ld	b, a
	ld	a, #0x07
	sub	a, b
	inc	a
	jr	00104$
00103$:
	srl	c
00104$:
	dec	a
	jr	NZ, 00103$
	ld	a, c
	and	a, #0x01
	ld	c, a
;huffman.c:14: ++bitc;
	ld	hl, (_bitc)
	inc	hl
	ld	(_bitc), hl
;huffman.c:15: return r;
	ld	l, c
;huffman.c:16: }
	ret
;huffman.c:17: unsigned char getByte(){
;	---------------------------------
; Function getByte
; ---------------------------------
_getByte::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;huffman.c:18: unsigned char out = 0;
	xor	a, a
	ld	-2 (ix), a
;huffman.c:19: int bpos = bitc/8;
	ld	de, (_bitc)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
;huffman.c:20: char st = bitc%8;
	ld	a, (#_bitc)
	and	a, #0x07
	ld	-1 (ix), a
;huffman.c:21: for (int i = 7; i >= 0; --i){
	ld	bc, #0x0007
00107$:
	bit	7, b
	jr	NZ,00105$
;huffman.c:22: if (st == 8){
	ld	a, -1 (ix)
	sub	a, #0x08
	jr	NZ,00102$
;huffman.c:23: st = 0;
	xor	a, a
	ld	-1 (ix), a
;huffman.c:24: ++bpos;
	inc	de
00102$:
;huffman.c:26: char b = BIT(imgind(bpos+boff), 7-(st));
	ld	a, e
	ld	hl, #_boff
	add	a, (hl)
	ld	-4 (ix), a
	ld	a, d
	inc	hl
	adc	a, (hl)
	ld	-3 (ix), a
	push	bc
	push	de
	ld	l, -4 (ix)
	ld	h, -3 (ix)
	push	hl
	call	_imgind
	pop	af
	ld	-3 (ix), l
	pop	de
	pop	bc
	ld	a, #0x07
	sub	a, -1 (ix)
	ld	l, -3 (ix)
	inc	a
	jr	00135$
00134$:
	srl	l
00135$:
	dec	a
	jr	NZ, 00134$
	ld	a, l
	and	a, #0x01
;huffman.c:27: if (b == 1){
	cp	a, #0x01
	jr	NZ,00104$
;huffman.c:29: out|=b<<(i);
	ld	l, a
	ld	a, c
	inc	a
	jr	00139$
00138$:
	sla	l
00139$:
	dec	a
	jr	NZ,00138$
	ld	a, l
	or	a, -2 (ix)
	ld	-2 (ix), a
00104$:
;huffman.c:33: ++bitc;
	ld	hl, (_bitc)
	inc	hl
	ld	(_bitc), hl
;huffman.c:34: ++st;
	inc	-1 (ix)
;huffman.c:21: for (int i = 7; i >= 0; --i){
	dec	bc
	jr	00107$
00105$:
;huffman.c:36: return out;
	ld	l, -2 (ix)
;huffman.c:37: }
	ld	sp, ix
	pop	ix
	ret
;huffman.c:38: struct huffman_node *loadNode(){
;	---------------------------------
; Function loadNode
; ---------------------------------
_loadNode::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;huffman.c:39: char bt = getBit();
	call	_getBit
	ld	-1 (ix), l
;huffman.c:41: memmk(ret, struct huffman_node);
	ld	bc, (_Vtrack)
	ld	hl, #_Vtrack
	ld	a, (hl)
	add	a, #0x05
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, #0x00
	ld	(hl), a
;huffman.c:42: ret->data = 0;
	xor	a, a
	ld	(bc), a
;huffman.c:43: ret->left = 0;
	ld	e, c
	ld	d, b
	inc	de
	ld	l, e
	ld	h, d
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;huffman.c:44: ret->right = 0;
	ld	hl, #0x0003
	add	hl, bc
	ex	(sp), hl
	pop	hl
	push	hl
	xor	a, a
	ld	(hl), a
	inc	hl
	ld	(hl), a
;huffman.c:46: if (bt == 1){
	ld	a, -1 (ix)
	dec	a
	jr	NZ,00102$
;huffman.c:47: ret->left = loadNode();
	push	bc
	push	de
	call	_loadNode
	ld	-2 (ix), l
	ld	-1 (ix), h
	pop	de
	pop	bc
	ld	a, -2 (ix)
	ld	(de), a
	inc	de
	ld	a, -1 (ix)
	ld	(de), a
;huffman.c:48: ret->right = loadNode();
	push	bc
	call	_loadNode
	ex	de,hl
	pop	bc
	pop	hl
	push	hl
	ld	(hl), e
	inc	hl
	ld	(hl), d
	jr	00103$
00102$:
;huffman.c:50: ret->data = getByte();
	push	bc
	call	_getByte
	ld	a, l
	pop	bc
	ld	(bc), a
00103$:
;huffman.c:52: return ret;
	ld	l, c
	ld	h, b
;huffman.c:54: }
	ld	sp, ix
	pop	ix
	ret
;huffman.c:55: void run()
;	---------------------------------
; Function run
; ---------------------------------
_run::
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	push	af
;huffman.c:57: bitc=0;
	ld	hl, #_bitc
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;huffman.c:58: char off = getByte();
	call	_getByte
	ld	a, l
;huffman.c:59: if (off !=0){
	or	a, a
	jr	Z,00102$
;huffman.c:60: bitc+=8-off;
	ld	c, a
	ld	b, #0x00
	ld	a, #0x08
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #_bitc
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
00102$:
;huffman.c:64: struct huffman_node *ret = loadNode();
	call	_loadNode
	ld	c, l
	ld	b, h
	inc	sp
	inc	sp
	push	bc
;huffman.c:65: off = getByte();
	call	_getByte
	ld	a, l
;huffman.c:66: if (off !=0){
	or	a, a
	jr	Z,00104$
;huffman.c:67: bitc+=8-off;
	ld	c, a
	ld	b, #0x00
	ld	a, #0x08
	sub	a, c
	ld	c, a
	ld	a, #0x00
	sbc	a, b
	ld	b, a
	ld	hl, #_bitc
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
00104$:
;huffman.c:69: struct huffman_node *cnode = ret;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
;huffman.c:73: while (bitc < lind(curr)*8){
	ld	bc, #0x0000
00112$:
	push	bc
	ld	hl, (_curr)
	push	hl
	call	_lind
	pop	af
	ex	de,hl
	pop	bc
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	add	hl, hl
	ex	de,hl
	ld	hl, #_bitc
	ld	a, (hl)
	sub	a, e
	inc	hl
	ld	a, (hl)
	sbc	a, d
	jr	NC,00115$
;huffman.c:74: char b = getBit();
	push	bc
	call	_getBit
	ld	a, l
	pop	bc
;huffman.c:75: if (b == 0){
	or	a, a
	jr	NZ,00106$
;huffman.c:76: cnode = cnode->left;
	pop	de
	pop	hl
	push	hl
	push	de
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
	jr	00107$
00106$:
;huffman.c:79: cnode = cnode->right;   
	pop	de
	pop	hl
	push	hl
	push	de
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	-2 (ix), a
	inc	hl
	ld	a, (hl)
	ld	-1 (ix), a
00107$:
;huffman.c:82: if (cnode->left == 0){
	pop	de
	pop	hl
	push	hl
	push	de
	inc	hl
	ld	a, (hl)
	inc	hl
	or	a, (hl)
	jr	NZ,00112$
;huffman.c:83: buff[pos] = cnode->data;
	ld	hl, #_buff
	ld	a, (hl)
	add	a, c
	ld	e, a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	d, a
	ld	l, -2 (ix)
	ld	h, -1 (ix)
	ld	a, (hl)
	ld	(de), a
;huffman.c:84: cnode = ret;
	ld	a, -4 (ix)
	ld	-2 (ix), a
	ld	a, -3 (ix)
	ld	-1 (ix), a
;huffman.c:85: ++pos;
	inc	bc
;huffman.c:86: if (pos > bsize)
	xor	a, a
	cp	a, c
	ld	a, #0x03
	sbc	a, b
	jp	PO, 00152$
	xor	a, #0x80
00152$:
	jp	P, 00112$
;huffman.c:87: return;
00115$:
;huffman.c:92: }
	ld	sp, ix
	pop	ix
	ret
;main.c:87: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:89: boff=0;
	ld	hl, #_boff
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;main.c:90: Vtrack = VARBIN;
	ld	hl, #_Vtrack
	ld	(hl), #0x72
	inc	hl
	ld	(hl), #0x98
;main.c:92: init_graphics();
	call	_init_graphics
;main.c:102: for (curr = 0; curr < sizeof(lens)/4; ++curr){
	ld	hl, #_curr
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
00102$:
;main.c:104: run();
	call	_run
;main.c:105: Vtrack = VARBIN;
	ld	hl, #_Vtrack
	ld	(hl), #0x72
	inc	hl
	ld	(hl), #0x98
;main.c:106: swap();
	call	_swap
;main.c:107: boff += lind(curr);
	ld	hl, (_curr)
	push	hl
	call	_lind
	pop	af
	ld	c, l
	ld	b, h
	ld	hl, #_boff
	ld	a, (hl)
	add	a, c
	ld	(hl), a
	inc	hl
	ld	a, (hl)
	adc	a, b
	ld	(hl), a
;main.c:108: wait128(32+8);
	ld	a, #0x28
	push	af
	inc	sp
	call	_wait128
	inc	sp
;main.c:102: for (curr = 0; curr < sizeof(lens)/4; ++curr){
	ld	hl, (_curr)
	inc	hl
	ld	(_curr), hl
	ld	hl, #_curr
	ld	a, (hl)
	sub	a, #0x08
	inc	hl
	ld	a, (hl)
	rla
	ccf
	rra
	sbc	a, #0x80
	jr	C,00102$
;main.c:124: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit____cio__current_line:
	.db #0x00	; 0
__xinit__img:
	.db #0x05	; 5
	.db #0x18	; 24
	.db #0x03	; 3
	.db #0x3f	; 63
	.db #0xde	; 222
	.db #0x0f	; 15
	.db #0xee	; 238
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0x5f	; 95
	.db #0x14	; 20
	.db #0x03	; 3
	.db #0xf1	; 241
	.db #0xc0	; 192
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0x51	; 81	'Q'
	.db #0xec	; 236
	.db #0x1e	; 30
	.db #0xc1	; 193
	.db #0xec	; 236
	.db #0x9e	; 158
	.db #0x1e	; 30
	.db #0x1e	; 30
	.db #0x1d	; 29
	.db #0x61	; 97	'a'
	.db #0xd6	; 214
	.db #0x1e	; 30
	.db #0xd0	; 208
	.db #0x9d	; 157
	.db #0x42	; 66	'B'
	.db #0x75	; 117	'u'
	.db #0x09	; 9
	.db #0xd4	; 212
	.db #0x27	; 39
	.db #0x68	; 104	'h'
	.db #0x4e	; 78	'N'
	.db #0xb3	; 179
	.db #0xe7	; 231
	.db #0xdb	; 219
	.db #0x7d	; 125
	.db #0x9f	; 159
	.db #0xbf	; 191
	.db #0xdf	; 223
	.db #0xef	; 239
	.db #0xf7	; 247
	.db #0xfb	; 251
	.db #0xfd	; 253
	.db #0xfe	; 254
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xbf	; 191
	.db #0xdf	; 223
	.db #0xed	; 237
	.db #0xfe	; 254
	.db #0xbf	; 191
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0xf7	; 247
	.db #0xc3	; 195
	.db #0x02	; 2
	.db #0xe0	; 224
	.db #0x8f	; 143
	.db #0x8f	; 143
	.db #0xb7	; 183
	.db #0xf5	; 245
	.db #0xf8	; 248
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0xfa	; 250
	.db #0x7e	; 126
	.db #0xbf	; 191
	.db #0x07	; 7
	.db #0xbc	; 188
	.db #0x27	; 39
	.db #0xf8	; 248
	.db #0xfd	; 253
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe3	; 227
	.db #0xbc	; 188
	.db #0x79	; 121	'y'
	.db #0x7a	; 122	'z'
	.db #0x2f	; 47
	.db #0x71	; 113	'q'
	.db #0x7b	; 123
	.db #0x8b	; 139
	.db #0xde	; 222
	.db #0x37	; 55	'7'
	.db #0x9c	; 156
	.db #0xbc	; 188
	.db #0xe5	; 229
	.db #0xec	; 236
	.db #0xcd	; 205
	.db #0xec	; 236
	.db #0xcd	; 205
	.db #0xe7	; 231
	.db #0x37	; 55	'7'
	.db #0x9c	; 156
	.db #0x4f	; 79	'O'
	.db #0x38	; 56	'8'
	.db #0x9e	; 158
	.db #0x73	; 115	's'
	.db #0x7b	; 123
	.db #0xc5	; 197
	.db #0xef	; 239
	.db #0x17	; 23
	.db #0xb8	; 184
	.db #0xbd	; 189
	.db #0x27	; 39
	.db #0xfa	; 250
	.db #0x4f	; 79	'O'
	.db #0xe0	; 224
	.db #0x61	; 97	'a'
	.db #0x3f	; 63
	.db #0x81	; 129
	.db #0x84	; 132
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0x10	; 16
	.db #0xb8	; 184
	.db #0x19	; 25
	.db #0x21	; 33
	.db #0x70	; 112	'p'
	.db #0xbc	; 188
	.db #0x86	; 134
	.db #0xc2	; 194
	.db #0xe4	; 228
	.db #0x36	; 54	'6'
	.db #0x17	; 23
	.db #0x26	; 38
	.db #0xe1	; 225
	.db #0x49	; 73	'I'
	.db #0xbd	; 189
	.db #0xc9	; 201
	.db #0xbd	; 189
	.db #0x26	; 38
	.db #0xf4	; 244
	.db #0x9b	; 155
	.db #0xdc	; 220
	.db #0x9b	; 155
	.db #0xdc	; 220
	.db #0x9b	; 155
	.db #0x05	; 5
	.db #0x1d	; 29
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0x5f	; 95
	.db #0xc8	; 200
	.db #0x0e	; 14
	.db #0xfb	; 251
	.db #0x3f	; 63
	.db #0xc7	; 199
	.db #0xe0	; 224
	.db #0xfd	; 253
	.db #0xf8	; 248
	.db #0x03	; 3
	.db #0xc0	; 192
	.db #0xf5	; 245
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x3e	; 62
	.db #0x00	; 0
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0x7f	; 127
	.db #0xbc	; 188
	.db #0x7b	; 123
	.db #0xc7	; 199
	.db #0xac	; 172
	.db #0x7a	; 122	'z'
	.db #0xd9	; 217
	.db #0xee	; 238
	.db #0x1b	; 27
	.db #0xda	; 218
	.db #0xcf	; 207
	.db #0x6b	; 107	'k'
	.db #0x3d	; 61
	.db #0xac	; 172
	.db #0xf6	; 246
	.db #0xb3	; 179
	.db #0xda	; 218
	.db #0xcf	; 207
	.db #0x69	; 105	'i'
	.db #0xbd	; 189
	.db #0xc3	; 195
	.db #0x7b	; 123
	.db #0x86	; 134
	.db #0xf5	; 245
	.db #0x83	; 131
	.db #0xf5	; 245
	.db #0x8f	; 143
	.db #0x5a	; 90	'Z'
	.db #0x3d	; 61
	.db #0xe8	; 232
	.db #0x3f	; 63
	.db #0x52	; 82	'R'
	.db #0x0f	; 15
	.db #0xd4	; 212
	.db #0x87	; 135
	.db #0x7d	; 125
	.db #0x21	; 33
	.db #0xdf	; 223
	.db #0x48	; 72	'H'
	.db #0x2e	; 46
	.db #0x90	; 144
	.db #0x5d	; 93
	.db #0x20	; 32
	.db #0xba	; 186
	.db #0x81	; 129
	.db #0x75	; 117	'u'
	.db #0x02	; 2
	.db #0xea	; 234
	.db #0x05	; 5
	.db #0xde	; 222
	.db #0x0b	; 11
	.db #0xac	; 172
	.db #0x17	; 23
	.db #0x78	; 120	'x'
	.db #0x75	; 117	'u'
	.db #0xde	; 222
	.db #0x0f	; 15
	.db #0x03	; 3
	.db #0x06	; 6
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0x39	; 57	'9'
	.db #0xf1	; 241
	.db #0x06	; 6
	.db #0xb8	; 184
	.db #0x07	; 7
	.db #0xf3	; 243
	.db #0xfb	; 251
	.db #0xfb	; 251
	.db #0xde	; 222
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x87	; 135
	.db #0xc0	; 192
	.db #0x76	; 118	'v'
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xd0	; 208
	.db #0x7d	; 125
	.db #0xbf	; 191
	.db #0x6a	; 106	'j'
	.db #0x1f	; 31
	.db #0x70	; 112	'p'
	.db #0xff	; 255
	.db #0x4b	; 75	'K'
	.db #0xfd	; 253
	.db #0x4f	; 79	'O'
	.db #0xf1	; 241
	.db #0x7e	; 126
	.db #0x2f	; 47
	.db #0xc3	; 195
	.db #0xc3	; 195
	.db #0xd4	; 212
	.db #0x7a	; 122	'z'
	.db #0x4f	; 79	'O'
	.db #0x49	; 73	'I'
	.db #0xee	; 238
	.db #0x0f	; 15
	.db #0x69	; 105	'i'
	.db #0xe8	; 232
	.db #0x8f	; 143
	.db #0x69	; 105	'i'
	.db #0xed	; 237
	.db #0x37	; 55	'7'
	.db #0x2e	; 46
	.db #0x9a	; 154
	.db #0xfd	; 253
	.db #0x97	; 151
	.db #0x4d	; 77	'M'
	.db #0x7e	; 126
	.db #0xca	; 202
	.db #0x34	; 52	'4'
	.db #0xbf	; 191
	.db #0x65	; 101	'e'
	.db #0x82	; 130
	.db #0x5f	; 95
	.db #0xb9	; 185
	.db #0x14	; 20
	.db #0xfd	; 253
	.db #0xd8	; 216
	.db #0x3f	; 63
	.db #0xa8	; 168
	.db #0x5f	; 95
	.db #0x50	; 80	'P'
	.db #0x31	; 49	'1'
	.db #0xc1	; 193
	.db #0x7c	; 124
	.db #0x17	; 23
	.db #0xc0	; 192
	.db #0xdd	; 221
	.db #0x81	; 129
	.db #0x05	; 5
	.db #0x10	; 16
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0xc7	; 199
	.db #0xfb	; 251
	.db #0x30	; 48	'0'
	.db #0x06	; 6
	.db #0x7f	; 127
	.db #0xdc	; 220
	.db #0x0c	; 12
	.db #0xfc	; 252
	.db #0x0f	; 15
	.db #0x7f	; 127
	.db #0x36	; 54	'6'
	.db #0x37	; 55	'7'
	.db #0x3b	; 59
	.db #0x42	; 66	'B'
	.db #0x40	; 64
	.db #0x6f	; 111	'o'
	.db #0xef	; 239
	.db #0x88	; 136
	.db #0x04	; 4
	.db #0x1f	; 31
	.db #0xa0	; 160
	.db #0x1e	; 30
	.db #0x10	; 16
	.db #0xfd	; 253
	.db #0x80	; 128
	.db #0x9f	; 159
	.db #0x01	; 1
	.db #0x32	; 50	'2'
	.db #0xf0	; 240
	.db #0x3a	; 58
	.db #0xda	; 218
	.db #0x0e	; 14
	.db #0xef	; 239
	.db #0x06	; 6
	.db #0x2f	; 47
	.db #0x06	; 6
	.db #0x77	; 119	'w'
	.db #0xe1	; 225
	.db #0x5f	; 95
	.db #0x8e	; 142
	.db #0xab	; 171
	.db #0x43	; 67	'C'
	.db #0xaa	; 170
	.db #0xd0	; 208
	.db #0xcb	; 203
	.db #0x5a	; 90	'Z'
	.db #0x1d	; 29
	.db #0x57	; 87	'W'
	.db #0xa7	; 167
	.db #0x55	; 85	'U'
	.db #0xe8	; 232
	.db #0xaf	; 175
	.db #0x46	; 70	'F'
	.db #0x77	; 119	'w'
	.db #0xa3	; 163
	.db #0x3b	; 59
	.db #0xd1	; 209
	.db #0x9d	; 157
	.db #0xc1	; 193
	.db #0x8b	; 139
	.db #0x87	; 135
	.db #0x7f	; 127
	.db #0xee	; 238
	.db #0x18	; 24
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xc6	; 198
	.db #0xb7	; 183
	.db #0x0c	; 12
	.db #0x6b	; 107	'k'
	.db #0x70	; 112	'p'
	.db #0xc6	; 198
	.db #0xb7	; 183
	.db #0x0c	; 12
	.db #0x6b	; 107	'k'
	.db #0x6d	; 109	'm'
	.db #0x9f	; 159
	.db #0x6e	; 110	'n'
	.db #0x5b	; 91
	.db #0xa6	; 166
	.db #0xca	; 202
	.db #0xd0	; 208
	.db #0xd9	; 217
	.db #0x5b	; 91
	.db #0xc7	; 199
	.db #0x74	; 116	't'
	.db #0x3b	; 59
	.db #0xaf	; 175
	.db #0x0e	; 14
	.db #0xeb	; 235
	.db #0xc3	; 195
	.db #0xea	; 234
	.db #0xf0	; 240
	.db #0xfa	; 250
	.db #0xbf	; 191
	.db #0x1f	; 31
	.db #0x6f	; 111	'o'
	.db #0xd9	; 217
	.db #0x0f	; 15
	.db #0xbf	; 191
	.db #0xdc	; 220
	.db #0x03	; 3
	.db #0x04	; 4
	.db #0x01	; 1
	.db #0x7f	; 127
	.db #0xe3	; 227
	.db #0xf8	; 248
	.db #0x3e	; 62
	.db #0x01	; 1
	.db #0x70	; 112	'p'
	.db #0x77	; 119	'w'
	.db #0xe4	; 228
	.db #0x07	; 7
	.db #0x40	; 64
	.db #0x2f	; 47
	.db #0xcf	; 207
	.db #0xfb	; 251
	.db #0xe2	; 226
	.db #0x07	; 7
	.db #0x78	; 120	'x'
	.db #0x6f	; 111	'o'
	.db #0xea	; 234
	.db #0x1d	; 29
	.db #0x80	; 128
	.db #0x1f	; 31
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x90	; 144
	.db #0x6d	; 109	'm'
	.db #0xdf	; 223
	.db #0xb0	; 176
	.db #0xff	; 255
	.db #0x70	; 112	'p'
	.db #0xf5	; 245
	.db #0xb8	; 184
	.db #0x6b	; 107	'k'
	.db #0xdb	; 219
	.db #0x91	; 145
	.db #0xff	; 255
	.db #0x8d	; 141
	.db #0x19	; 25
	.db #0xe3	; 227
	.db #0xf3	; 243
	.db #0xbc	; 188
	.db #0x30	; 48	'0'
	.db #0xb8	; 184
	.db #0x63	; 99	'c'
	.db #0x6b	; 107	'k'
	.db #0xe3	; 227
	.db #0x1e	; 30
	.db #0xa9	; 169
	.db #0x8d	; 141
	.db #0x57	; 87	'W'
	.db #0x37	; 55	'7'
	.db #0x5f	; 95
	.db #0xd6	; 214
	.db #0xf3	; 243
	.db #0xb5	; 181
	.db #0xc4	; 196
	.db #0xed	; 237
	.db #0x7c	; 124
	.db #0x9d	; 157
	.db #0xaf	; 175
	.db #0x92	; 146
	.db #0xab	; 171
	.db #0x1d	; 29
	.db #0xb8	; 184
	.db #0xef	; 239
	.db #0x3b	; 59
	.db #0x2f	; 47
	.db #0x3b	; 59
	.db #0x35	; 53	'5'
	.db #0x79	; 121	'y'
	.db #0xf5	; 245
	.db #0x39	; 57	'9'
	.db #0x5e	; 94
	.db #0x7a	; 122	'z'
	.db #0x9b	; 155
	.db #0x5e	; 94
	.db #0x6a	; 106	'j'
	.db #0x2f	; 47
	.db #0x7a	; 122	'z'
	.db #0x8c	; 140
	.db #0xf7	; 247
	.db #0xfc	; 252
	.db #0x6b	; 107	'k'
	.db #0x7f	; 127
	.db #0xe3	; 227
	.db #0x6f	; 111	'o'
	.db #0xbf	; 191
	.db #0xe0	; 224
	.db #0xc8	; 200
	.db #0x32	; 50	'2'
	.db #0x0c	; 12
	.db #0x83	; 131
	.db #0x20	; 32
	.db #0xc8	; 200
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc1	; 193
	.db #0xfb	; 251
	.db #0xf0	; 240
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0xc1	; 193
	.db #0x00	; 0
	.db #0x1b	; 27
	.db #0xff	; 255
	.db #0xa2	; 162
	.db #0x1f	; 31
	.db #0x17	; 23
	.db #0xf0	; 240
	.db #0x0d	; 13
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x3b	; 59
	.db #0xcf	; 207
	.db #0x63	; 99	'c'
	.db #0xca	; 202
	.db #0xcf	; 207
	.db #0x85	; 133
	.db #0xe1	; 225
	.db #0x3f	; 63
	.db #0x09	; 9
	.db #0xf9	; 249
	.db #0x93	; 147
	.db #0xf3	; 243
	.db #0x27	; 39
	.db #0xe1	; 225
	.db #0x3f	; 63
	.db #0x0b	; 11
	.db #0xc2	; 194
	.db #0xf2	; 242
	.db #0xb5	; 181
	.db #0xed	; 237
	.db #0x93	; 147
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xfb	; 251
	.db #0xe0	; 224
	.db #0x0f	; 15
	.db #0x01	; 1
	.db #0x0f	; 15
	.db #0xf1	; 241
	.db #0xf3	; 243
	.db #0xc3	; 195
	.db #0x63	; 99	'c'
	.db #0x0c	; 12
	.db #0x27	; 39
	.db #0x71	; 113	'q'
	.db #0xc6	; 198
	.db #0xfc	; 252
	.db #0x3f	; 63
	.db #0xf3	; 243
	.db #0x81	; 129
	.db #0x80	; 128
	.db #0x3c	; 60
	.db #0x80	; 128
	.db #0xbf	; 191
	.db #0xf9	; 249
	.db #0x01	; 1
	.db #0xfc	; 252
	.db #0x0f	; 15
	.db #0xc0	; 192
	.db #0x20	; 32
	.db #0x3b	; 59
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x05	; 5
	.db #0x77	; 119	'w'
	.db #0x11	; 17
	.db #0x38	; 56	'8'
	.db #0x28	; 40
	.db #0x9d	; 157
	.db #0xd4	; 212
	.db #0x8f	; 143
	.db #0xd2	; 210
	.db #0x7a	; 122	'z'
	.db #0xe0	; 224
	.db #0xc2	; 194
	.db #0xa7	; 167
	.db #0xae	; 174
	.db #0x24	; 36
	.db #0x8f	; 143
	.db #0x1a	; 26
	.db #0x39	; 57	'9'
	.db #0x23	; 35
	.db #0xc2	; 194
	.db #0x48	; 72	'H'
	.db #0xa7	; 167
	.db #0xb5	; 181
	.db #0x20	; 32
	.db #0xcf	; 207
	.db #0x75	; 117	'u'
	.db #0x20	; 32
	.db #0xee	; 238
	.db #0x3c	; 60
	.db #0x90	; 144
	.db #0x9b	; 155
	.db #0xe5	; 229
	.db #0x46	; 70	'F'
	.db #0xef	; 239
	.db #0x95	; 149
	.db #0x34	; 52	'4'
	.db #0xf6	; 246
	.db #0x1a	; 26
	.db #0x9d	; 157
	.db #0xd8	; 216
	.db #0x6a	; 106	'j'
	.db #0xf6	; 246
	.db #0xa7	; 167
	.db #0xbb	; 187
	.db #0x53	; 83	'S'
	.db #0xfd	; 253
	.db #0xa8	; 168
	.db #0x50	; 80	'P'
	.db #0xb7	; 183
	.db #0x51	; 81	'Q'
	.db #0x01	; 1
	.db #0xe5	; 229
	.db #0x65	; 101	'e'
	.db #0xbe	; 190
	.db #0xc9	; 201
	.db #0xb9	; 185
	.db #0xb2	; 178
	.db #0x09	; 9
	.db #0xd8	; 216
	.db #0x00	; 0
	.db #0x7f	; 127
	.db #0x8a	; 138
	.db #0x63	; 99	'c'
	.db #0xdf	; 223
	.db #0x33	; 51	'3'
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xe4	; 228
	.db #0xfb	; 251
	.db #0x3f	; 63
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0xaf	; 175
	.db #0xc7	; 199
	.db #0x13	; 19
	.db #0x83	; 131
	.db #0xf6	; 246
	.db #0xfe	; 254
	.db #0x3f	; 63
	.db #0x80	; 128
	.db #0x3d	; 61
	.db #0xf6	; 246
	.db #0xf9	; 249
	.db #0x7e	; 126
	.db #0x50	; 80	'P'
	.db #0x03	; 3
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0x60	; 96
	.db #0x6c	; 108	'l'
	.db #0xf0	; 240
	.db #0x1d	; 29
	.db #0xe0	; 224
	.db #0x06	; 6
	.db #0xef	; 239
	.db #0x80	; 128
	.db #0x14	; 20
	.db #0x40	; 64
	.db #0x0f	; 15
	.db #0xcc	; 204
	.db #0x00	; 0
	.db #0x58	; 88	'X'
	.db #0x04	; 4
	.db #0x08	; 8
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xa2	; 162
	.db #0xd3	; 211
	.db #0xd1	; 209
	.db #0x6b	; 107	'k'
	.db #0xed	; 237
	.db #0x9b	; 155
	.db #0xfb	; 251
	.db #0x86	; 134
	.db #0x3c	; 60
	.db #0x47	; 71	'G'
	.db #0xe7	; 231
	.db #0xd2	; 210
	.db #0xa5	; 165
	.db #0xf4	; 244
	.db #0xa9	; 169
	.db #0x7e	; 126
	.db #0xc7	; 199
	.db #0xdc	; 220
	.db #0xaf	; 175
	.db #0xca	; 202
	.db #0xfd	; 253
	.db #0xd3	; 211
	.db #0xbf	; 191
	.db #0x78	; 120	'x'
	.db #0xf6	; 246
	.db #0x91	; 145
	.db #0x89	; 137
	.db #0x92	; 146
	.db #0xf8	; 248
	.db #0x45	; 69	'E'
	.db #0xfa	; 250
	.db #0x89	; 137
	.db #0xb2	; 178
	.db #0x49	; 73	'I'
	.db #0x38	; 56	'8'
	.db #0x04	; 4
	.db #0x9e	; 158
	.db #0x08	; 8
	.db #0x47	; 71	'G'
	.db #0xa4	; 164
	.db #0x6a	; 106	'j'
	.db #0xe1	; 225
	.db #0x8d	; 141
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0x7d	; 125
	.db #0x3e	; 62
	.db #0x27	; 39
	.db #0xf7	; 247
	.db #0xee	; 238
	.db #0x0b	; 11
	.db #0x02	; 2
	.db #0x59	; 89	'Y'
	.db #0xcd	; 205
	.db #0xec	; 236
	.db #0x3e	; 62
	.db #0x0f	; 15
	.db #0xc7	; 199
	.db #0xef	; 239
	.db #0xcb	; 203
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc0	; 192
	.db #0xcf	; 207
	.db #0x08	; 8
	.db #0xbd	; 189
	.db #0xa9	; 169
	.db #0xe3	; 227
	.db #0x5f	; 95
	.db #0x73	; 115	's'
	.db #0x3d	; 61
	.db #0xcb	; 203
	.db #0xf2	; 242
	.db #0x76	; 118	'v'
	.db #0x95	; 149
	.db #0xe9	; 233
	.db #0xcc	; 204
	.db #0xf5	; 245
	.db #0xf3	; 243
	.db #0xa7	; 167
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xc0	; 192
	.db #0x17	; 23
	.db #0xf2	; 242
	.db #0x0f	; 15
	.db #0xb0	; 176
	.db #0xc3	; 195
	.db #0xf0	; 240
	.db #0x3d	; 61
	.db #0x3e	; 62
	.db #0xfd	; 253
	.db #0xef	; 239
	.db #0xc0	; 192
	.db #0x1c	; 28
	.db #0x32	; 50	'2'
	.db #0x01	; 1
	.db #0xdb	; 219
	.db #0xee	; 238
	.db #0x09	; 9
	.db #0x11	; 17
	.db #0xa6	; 166
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf5	; 245
	.db #0xbd	; 189
	.db #0x74	; 116	't'
	.db #0xfb	; 251
	.db #0x09	; 9
	.db #0xf2	; 242
	.db #0x57	; 87	'W'
	.db #0xd5	; 213
	.db #0xe4	; 228
	.db #0xcf	; 207
	.db #0xda	; 218
	.db #0xf9	; 249
	.db #0xfc	; 252
	.db #0xcf	; 207
	.db #0xc3	; 195
	.db #0x7d	; 125
	.db #0xc0	; 192
	.db #0x3b	; 59
	.db #0xa0	; 160
	.db #0x72	; 114	'r'
	.db #0x78	; 120	'x'
	.db #0x7b	; 123
	.db #0xe8	; 232
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0xe0	; 224
	.db #0x37	; 55	'7'
	.db #0x85	; 133
	.db #0xee	; 238
	.db #0xbf	; 191
	.db #0x7e	; 126
	.db #0x00	; 0
	.db #0x3a	; 58
	.db #0x7d	; 125
	.db #0xfc	; 252
	.db #0x1f	; 31
	.db #0xcf	; 207
	.db #0xf1	; 241
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x60	; 96
	.db #0xbc	; 188
	.db #0xec	; 236
	.db #0x0b	; 11
	.db #0xe0	; 224
	.db #0x9e	; 158
	.db #0xff	; 255
	.db #0x06	; 6
	.db #0x3f	; 63
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xfa	; 250
	.db #0x59	; 89	'Y'
	.db #0xe2	; 226
	.db #0xcf	; 207
	.db #0x7c	; 124
	.db #0xbe	; 190
	.db #0x2d	; 45
	.db #0x78	; 120	'x'
	.db #0xb5	; 181
	.db #0xe2	; 226
	.db #0xff	; 255
	.db #0xd2	; 210
	.db #0xbe	; 190
	.db #0x90	; 144
	.db #0x3c	; 60
	.db #0x5b	; 91
	.db #0xf0	; 240
	.db #0x5b	; 91
	.db #0xf1	; 241
	.db #0x30	; 48	'0'
	.db #0xb4	; 180
	.db #0xb9	; 185
	.db #0x77	; 119	'w'
	.db #0xee	; 238
	.db #0xfd	; 253
	.db #0xc8	; 200
	.db #0x7d	; 125
	.db #0xe6	; 230
	.db #0x23	; 35
	.db #0xbc	; 188
	.db #0xc4	; 196
	.db #0x72	; 114	'r'
	.db #0x51	; 81	'Q'
	.db #0xc9	; 201
	.db #0x5e	; 94
	.db #0x4a	; 74	'J'
	.db #0xf2	; 242
	.db #0x57	; 87	'W'
	.db #0x92	; 146
	.db #0xbc	; 188
	.db #0x95	; 149
	.db #0xe4	; 228
	.db #0xaf	; 175
	.db #0x03	; 3
	.db #0x07	; 7
	.db #0x9f	; 159
	.db #0xdf	; 223
	.db #0x80	; 128
	.db #0x0e	; 14
	.db #0x01	; 1
	.db #0x4f	; 79	'O'
	.db #0x87	; 135
	.db #0xf7	; 247
	.db #0xf5	; 245
	.db #0xe6	; 230
	.db #0xc1	; 193
	.db #0xef	; 239
	.db #0x81	; 129
	.db #0xfc	; 252
	.db #0x06	; 6
	.db #0xf0	; 240
	.db #0xd0	; 208
	.db #0x29	; 41
	.db #0x7b	; 123
	.db #0x7d	; 125
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xc4	; 196
	.db #0x3d	; 61
	.db #0xc0	; 192
	.db #0x78	; 120	'x'
	.db #0xaf	; 175
	.db #0x8b	; 139
	.db #0x9f	; 159
	.db #0x10	; 16
	.db #0xf1	; 241
	.db #0x5f	; 95
	.db #0x63	; 99	'c'
	.db #0xaf	; 175
	.db #0x62	; 98	'b'
	.db #0x3c	; 60
	.db #0x51	; 81	'Q'
	.db #0xee	; 238
	.db #0xd1	; 209
	.db #0xec	; 236
	.db #0x79	; 121	'y'
	.db #0xec	; 236
	.db #0x7b	; 123
	.db #0x6b	; 107	'k'
	.db #0xed	; 237
	.db #0x7d	; 125
	.db #0xbb	; 187
	.db #0xee	; 238
	.db #0xd8	; 216
	.db #0x27	; 39
	.db #0xbf	; 191
	.db #0x04	; 4
	.db #0xf2	; 242
	.db #0x53	; 83	'S'
	.db #0xc9	; 201
	.db #0x5e	; 94
	.db #0x4a	; 74	'J'
	.db #0xf2	; 242
	.db #0x57	; 87	'W'
	.db #0x92	; 146
	.db #0xbc	; 188
	.db #0x95	; 149
	.db #0xe4	; 228
	.db #0xaf	; 175
	.db #0x07	; 7
	.db #0x7e	; 126
	.db #0xdf	; 223
	.db #0x27	; 39
	.db #0x8f	; 143
	.db #0xdf	; 223
	.db #0x90	; 144
	.db #0x7c	; 124
	.db #0x02	; 2
	.db #0xc1	; 193
	.db #0x80	; 128
	.db #0x3b	; 59
	.db #0xf9	; 249
	.db #0xe1	; 225
	.db #0x0f	; 15
	.db #0xbe	; 190
	.db #0x36	; 54	'6'
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x5f	; 95
	.db #0xc0	; 192
	.db #0x6a	; 106	'j'
	.db #0xfb	; 251
	.db #0xcd	; 205
	.db #0xc6	; 198
	.db #0xff	; 255
	.db #0x04	; 4
	.db #0x0f	; 15
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xb1	; 177
	.db #0xf1	; 241
	.db #0xfb	; 251
	.db #0x2d	; 45
	.db #0x78	; 120	'x'
	.db #0x87	; 135
	.db #0xc5	; 197
	.db #0xd7	; 215
	.db #0x8b	; 139
	.db #0xbf	; 191
	.db #0x16	; 22
	.db #0xbc	; 188
	.db #0x5e	; 94
	.db #0x7b	; 123
	.db #0x66	; 102	'f'
	.db #0xf6	; 246
	.db #0x4d	; 77	'M'
	.db #0xed	; 237
	.db #0x9b	; 155
	.db #0xd8	; 216
	.db #0x7b	; 123
	.db #0xfd	; 253
	.db #0xf7	; 247
	.db #0xdf	; 223
	.db #0xfc	; 252
	.db #0xf0	; 240
	.db #0x39	; 57	'9'
	.db #0xc2	; 194
	.db #0xe7	; 231
	.db #0x38	; 56	'8'
	.db #0x5c	; 92
	.db #0xe9	; 233
	.db #0x03	; 3
	.db #0xd2	; 210
	.db #0x2e	; 46
	.db #0x91	; 145
	.db #0x74	; 116	't'
	.db #0x8b	; 139
	.db #0xa4	; 164
	.db #0x5d	; 93
	.db #0x22	; 34
	.db #0xe9	; 233
	.db #0x17	; 23
	.db #0x07	; 7
	.db #0x7b	; 123
	.db #0xf0	; 240
	.db #0x7f	; 127
	.db #0x07	; 7
	.db #0xc0	; 192
	.db #0x72	; 114	'r'
	.db #0x7b	; 123
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xdf	; 223
	.db #0x16	; 22
	.db #0x7c	; 124
	.db #0xfe	; 254
	.db #0x07	; 7
	.db #0xef	; 239
	.db #0x07	; 7
	.db #0xed	; 237
	.db #0x06	; 6
	.db #0xbf	; 191
	.db #0xde	; 222
	.db #0x6e	; 110	'n'
	.db #0x1b	; 27
	.db #0xbd	; 189
	.db #0x82	; 130
	.db #0xff	; 255
	.db #0x05	; 5
	.db #0x1f	; 31
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x0f	; 15
	.db #0xb3	; 179
	.db #0xec	; 236
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0xf6	; 246
	.db #0x36	; 54	'6'
	.db #0xf0	; 240
	.db #0x1f	; 31
	.db #0x06	; 6
	.db #0xfe	; 254
	.db #0x06	; 6
	.db #0xf6	; 246
	.db #0x1b	; 27
	.db #0xdc	; 220
	.db #0x1b	; 27
	.db #0xdc	; 220
	.db #0xba	; 186
	.db #0xfb	; 251
	.db #0xbf	; 191
	.db #0xef	; 239
	.db #0x3e	; 62
	.db #0xf7	; 247
	.db #0xe7	; 231
	.db #0xdf	; 223
	.db #0x73	; 115	's'
	.db #0xc5	; 197
	.db #0xae	; 174
	.db #0xfc	; 252
	.db #0x5a	; 90	'Z'
	.db #0xe9	; 233
	.db #0x1d	; 29
	.db #0xd2	; 210
	.db #0x2e	; 46
	.db #0x91	; 145
	.db #0x74	; 116	't'
	.db #0x8b	; 139
	.db #0xa4	; 164
	.db #0x5d	; 93
	.db #0x22	; 34
	.db #0xe9	; 233
	.db #0x17	; 23
	.db #0x07	; 7
	.db #0x7b	; 123
	.db #0xe0	; 224
	.db #0x1f	; 31
	.db #0xbf	; 191
	.db #0x07	; 7
	.db #0xf0	; 240
	.db #0x1b	; 27
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0xef	; 239
	.db #0xd0	; 208
	.db #0x3d	; 61
	.db #0x7e	; 126
	.db #0xe7	; 231
	.db #0xe7	; 231
	.db #0xf7	; 247
	.db #0x85	; 133
	.db #0xf6	; 246
	.db #0xf3	; 243
	.db #0xdc	; 220
	.db #0x2e	; 46
	.db #0xf8	; 248
	.db #0x7c	; 124
	.db #0x4e	; 78	'N'
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xf9	; 249
	.db #0x3e	; 62
	.db #0x1f	; 31
	.db #0x02	; 2
	.db #0xf8	; 248
	.db #0x38	; 56	'8'
	.db #0xf0	; 240
	.db #0xf8	; 248
	.db #0x17	; 23
	.db #0xc8	; 200
	.db #0x3e	; 62
	.db #0x43	; 67	'C'
	.db #0x78	; 120	'x'
	.db #0x1b	; 27
	.db #0xdc	; 220
	.db #0x9b	; 155
	.db #0xd8	; 216
	.db #0x67	; 103	'g'
	.db #0xd8	; 216
	.db #0x6a	; 106	'j'
	.db #0xeb	; 235
	.db #0xee	; 238
	.db #0xfe	; 254
	.db #0xf3	; 243
	.db #0xe7	; 231
	.db #0x69	; 105	'i'
	.db #0xef	; 239
	.db #0x39	; 57	'9'
	.db #0x5b	; 91
	.db #0xe7	; 231
	.db #0x7c	; 124
	.db #0xdf	; 223
	.db #0x49	; 73	'I'
	.db #0xff	; 255
	.db #0x49	; 73	'I'
	.db #0x9e	; 158
	.db #0x90	; 144
	.db #0xf4	; 244
	.db #0x87	; 135
	.db #0xa4	; 164
	.db #0x3d	; 61
	.db #0x21	; 33
	.db #0xe9	; 233
	.db #0x0f	; 15
__xinit__lens:
	.dw #0x003a
	.dw #0x005a
	.dw #0x0050
	.dw #0x0051
	.dw #0x0069
	.dw #0x0061
	.dw #0x0037
	.dw #0x0068
	.dw #0x0059
	.dw #0x0038
	.dw #0x003d
	.dw #0x004a
	.dw #0x004a
	.dw #0x004c
	.dw #0x004b
	.dw #0x004c
	.area _CABS (ABS)
