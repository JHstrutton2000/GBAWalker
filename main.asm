;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW64)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _memcpy
	.globl _display_off
	.globl _wait_vbl_done
	.globl _joypad
	.globl _counter
	.globl _RightPressed
	.globl _LeftPressed
	.globl _DownPressed
	.globl _UpPressed
	.globl _requestData
	.globl _spriteAttributes
	.globl _InputData
	.globl _tilemap
	.globl _pallets
	.globl _vram
	.globl _PlayerSprites
	.globl _prevplayerDir
	.globl _playerDir
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_main_joy_131073_155:
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_playerDir::
	.ds 2
_prevplayerDir::
	.ds 2
_y:
	.ds 2
_x:
	.ds 2
_PlayerSprites::
	.ds 704
_vram::
	.ds 2
_pallets::
	.ds 2
_tilemap::
	.ds 2
_InputData::
	.ds 2
_spriteAttributes::
	.ds 2
_requestData::
	.ds 2
_UpPressed::
	.ds 1
_DownPressed::
	.ds 1
_LeftPressed::
	.ds 1
_RightPressed::
	.ds 1
_counter::
	.ds 2
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
;main.c:88: static uint8_t joy = 0;
	ld	hl, #_main_joy_131073_155
	ld	(hl), #0x00
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:22: void main(){
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:23: SPRITES_8x16;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x04
	ldh	(_LCDC_REG + 0), a
;c:\gbdk\include\gb\gb.h:754: __asm__("di");
	di
;main.c:26: DISPLAY_OFF;
	call	_display_off
;main.c:27: LCDC_REG = 0x47;
	ld	a, #0x47
	ldh	(_LCDC_REG + 0), a
;main.c:28: BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;main.c:30: memcpy(vram, PlayerSprites, sizeof(PlayerSprites));
	ld	bc, #_PlayerSprites+0
	ld	hl, #_vram
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x02c0
	push	hl
	call	_memcpy
;main.c:32: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;c:\gbdk\include\gb\gb.h:738: __asm__("ei");
	ei
;main.c:35: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;main.c:37: while(1){
00151$:
;main.c:40: if(counter < 5){
	ld	hl, #_counter
	ld	a, (hl+)
	sub	a, #0x05
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	ld	e, a
	bit	7, e
	jr	Z, 00283$
	bit	7, d
	jr	NZ, 00284$
	cp	a, a
	jr	00284$
00283$:
	bit	7, d
	jr	Z, 00284$
	scf
00284$:
	ld	a, #0x00
	rla
	ld	c, a
;main.c:39: if(playerDir == backward) {//0, 1, 2, 3 || 16, 17, 18, 19 down
	ld	hl, #_playerDir + 1
	ld	a, (hl-)
;main.c:40: if(counter < 5){
	or	a,(hl)
	jr	NZ, 00122$
	or	a,c
	jr	Z, 00102$
;main.c:41: shadow_OAM[0].tile = 1;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x01
;main.c:42: shadow_OAM[1].tile = 2;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x02
	jr	00123$
00102$:
;main.c:45: shadow_OAM[0].tile = 17;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x11
;main.c:46: shadow_OAM[1].tile = 18;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x12
	jr	00123$
00122$:
;main.c:49: else if(playerDir == left) {//4, 5, 6, 7 || 24, 25, 26, 27 left
	ld	hl, #_playerDir
	ld	a, (hl+)
	dec	a
;main.c:50: if(counter < 5){
	or	a,(hl)
	jr	NZ, 00119$
	or	a,c
	jr	Z, 00105$
;main.c:51: shadow_OAM[0].tile = 5;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x05
;main.c:52: shadow_OAM[1].tile = 6;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x06
	jr	00123$
00105$:
;main.c:55: shadow_OAM[0].tile = 25;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x19
;main.c:56: shadow_OAM[1].tile = 26;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x1a
	jr	00123$
00119$:
;main.c:59: else if(playerDir == right) {//8, 9, 10, 11 || 32, 33, 34, 35 right
	ld	hl, #_playerDir
	ld	a, (hl+)
	sub	a, #0x03
;main.c:60: if(counter < 5){
	or	a,(hl)
	jr	NZ, 00116$
	or	a,c
	jr	Z, 00108$
;main.c:61: shadow_OAM[0].tile = 9;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x09
;main.c:62: shadow_OAM[1].tile = 10;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0a
	jr	00123$
00108$:
;main.c:65: shadow_OAM[0].tile = 33;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x21
;main.c:66: shadow_OAM[1].tile = 34;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x22
	jr	00123$
00116$:
;main.c:69: else if(playerDir == forward) {//12, 13, 14, 15 || 40, 41, 42, 43 up
	ld	hl, #_playerDir
	ld	a, (hl+)
	sub	a, #0x02
;main.c:70: if(counter < 5){
	or	a,(hl)
	jr	NZ, 00123$
	or	a,c
	jr	Z, 00111$
;main.c:71: shadow_OAM[0].tile = 13;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x0d
;main.c:72: shadow_OAM[1].tile = 14;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x0e
	jr	00123$
00111$:
;main.c:75: shadow_OAM[0].tile = 41;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x29
;main.c:76: shadow_OAM[1].tile = 42;
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x2a
00123$:
;main.c:85: playerDir = prevplayerDir;
	ld	a, (#_prevplayerDir)
	ld	(#_playerDir),a
	ld	a, (#_prevplayerDir + 1)
	ld	(#_playerDir + 1),a
;main.c:90: *(unsigned char*)(InputData) = requestData; //request input data
	ld	hl, #_InputData
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_requestData
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:91: joy = *(unsigned char*)(InputData);  //retrieve input data
	ld	hl, #_InputData
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ld	hl, #_main_joy_131073_155
	ld	(hl), a
;main.c:93: joy = joy&0x0F; //get the relevant 4 bits
	ld	a, (hl)
	and	a, #0x0f
	ld	(hl), a
;main.c:95: if (joypad() & J_UP)
	call	_joypad
	bit	2, a
	jr	Z, 00125$
;main.c:96: UpPressed = 1;
	ld	hl, #_UpPressed
	ld	(hl), #0x01
	jr	00126$
00125$:
;main.c:98: UpPressed = 0;
	ld	hl, #_UpPressed
	ld	(hl), #0x00
00126$:
;main.c:100: if (joypad() & J_DOWN) 
	call	_joypad
	bit	3, a
	jr	Z, 00128$
;main.c:101: DownPressed = 1;
	ld	hl, #_DownPressed
	ld	(hl), #0x01
	jr	00129$
00128$:
;main.c:103: DownPressed = 0;
	ld	hl, #_DownPressed
	ld	(hl), #0x00
00129$:
;main.c:105: if (joypad() & J_LEFT)
	call	_joypad
	bit	1, a
	jr	Z, 00131$
;main.c:106: LeftPressed = 1;
	ld	hl, #_LeftPressed
	ld	(hl), #0x01
	jr	00132$
00131$:
;main.c:108: LeftPressed = 0;
	ld	hl, #_LeftPressed
	ld	(hl), #0x00
00132$:
;main.c:110: if (joypad() & J_RIGHT) 
	call	_joypad
	rrca
	jr	NC, 00134$
;main.c:111: RightPressed = 1;
	ld	hl, #_RightPressed
	ld	(hl), #0x01
	jr	00135$
00134$:
;main.c:113: RightPressed = 0;
	ld	hl, #_RightPressed
	ld	(hl), #0x00
00135$:
;main.c:115: if(UpPressed){
	ld	a, (#_UpPressed)
	or	a, a
	jr	Z, 00145$
;main.c:116: playerDir = forward;
	ld	hl, #_playerDir
	ld	a, #0x02
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;main.c:117: y--;
	ld	hl, #_y
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00146$
00145$:
;main.c:119: else if(DownPressed){
	ld	a, (#_DownPressed)
	or	a, a
	jr	Z, 00142$
;main.c:120: playerDir = backward;
	xor	a, a
	ld	hl, #_playerDir
	ld	(hl+), a
	ld	(hl), a
;main.c:121: y++;
	ld	hl, #_y
	inc	(hl)
	jr	NZ, 00146$
	inc	hl
	inc	(hl)
	jr	00146$
00142$:
;main.c:123: else if(LeftPressed){
	ld	a, (#_LeftPressed)
	or	a, a
	jr	Z, 00139$
;main.c:124: playerDir = left;
	ld	hl, #_playerDir
	ld	a, #0x01
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;main.c:125: x--;
	ld	hl, #_x
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	dec	de
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	jr	00146$
00139$:
;main.c:127: else if(RightPressed){
	ld	a, (#_RightPressed)
	or	a, a
	jr	Z, 00146$
;main.c:128: playerDir = right;
	ld	hl, #_playerDir
	ld	a, #0x03
	ld	(hl+), a
	xor	a, a
	ld	(hl), a
;main.c:129: x++;
	ld	hl, #_x
	inc	(hl)
	jr	NZ, 00296$
	inc	hl
	inc	(hl)
00296$:
00146$:
;main.c:141: shadow_OAM[0].x = x-4;
	ld	a, (#_x)
	add	a, #0xfc
	ld	(#(_shadow_OAM + 1)),a
;main.c:142: shadow_OAM[0].y = y;
	ld	a, (#_y)
	ld	(#_shadow_OAM),a
;main.c:144: shadow_OAM[1].x = x+4;
	ld	a, (#_x)
	add	a, #0x04
	ld	(#(_shadow_OAM + 5)),a
;main.c:145: shadow_OAM[1].y = y;
	ld	a, (#_y)
	ld	(#(_shadow_OAM + 4)),a
;main.c:147: if(counter >= 10)
	ld	hl, #_counter
	ld	a, (hl+)
	sub	a, #0x0a
	ld	a, (hl)
	sbc	a, #0x00
	ld	d, (hl)
	ld	a, #0x00
	bit	7,a
	jr	Z, 00297$
	bit	7, d
	jr	NZ, 00298$
	cp	a, a
	jr	00298$
00297$:
	bit	7, d
	jr	Z, 00298$
	scf
00298$:
	jr	C, 00148$
;main.c:148: counter = 0;
	xor	a, a
	ld	hl, #_counter
	ld	(hl+), a
	ld	(hl), a
	jr	00149$
00148$:
;main.c:150: counter++;
	ld	hl, #_counter
	inc	(hl)
	jr	NZ, 00299$
	inc	hl
	inc	(hl)
00299$:
00149$:
;main.c:152: wait_vbl_done();    // wait for VBlank
	call	_wait_vbl_done
;main.c:154: }
	jp	00151$
	.area _CODE
	.area _INITIALIZER
__xinit__playerDir:
	.dw #0x0000
__xinit__prevplayerDir:
	.dw #0xffff
__xinit__y:
	.dw #0x003c
__xinit__x:
	.dw #0x003c
__xinit__PlayerSprites:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x22	; 34
	.db #0x2a	; 42
	.db #0x12	; 18
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x48	; 72	'H'
	.db #0x7e	; 126
	.db #0x48	; 72	'H'
	.db #0x6f	; 111	'o'
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x14	; 20
	.db #0x94	; 148
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x12	; 18
	.db #0x7e	; 126
	.db #0x12	; 18
	.db #0xf6	; 246
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0xb8	; 184
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x60	; 96
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0xc0	; 192
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x1d	; 29
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x06	; 6
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x03	; 3
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x2f	; 47
	.db #0x20	; 32
	.db #0x2f	; 47
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x48	; 72	'H'
	.db #0x7f	; 127
	.db #0x48	; 72	'H'
	.db #0x6f	; 111	'o'
	.db #0x38	; 56	'8'
	.db #0x3f	; 63
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xf4	; 244
	.db #0x04	; 4
	.db #0xf4	; 244
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x12	; 18
	.db #0xfe	; 254
	.db #0x12	; 18
	.db #0xf6	; 246
	.db #0x1c	; 28
	.db #0xfc	; 252
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x22	; 34
	.db #0x2a	; 42
	.db #0x12	; 18
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x28	; 40
	.db #0x2e	; 46
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x14	; 20
	.db #0x94	; 148
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x7c	; 124
	.db #0x24	; 36
	.db #0xec	; 236
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x28	; 40
	.db #0x29	; 41
	.db #0x22	; 34
	.db #0x2a	; 42
	.db #0x12	; 18
	.db #0x1a	; 26
	.db #0x08	; 8
	.db #0x0c	; 12
	.db #0x17	; 23
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x3e	; 62
	.db #0x24	; 36
	.db #0x37	; 55	'7'
	.db #0x1c	; 28
	.db #0x1f	; 31
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x14	; 20
	.db #0x94	; 148
	.db #0x44	; 68	'D'
	.db #0x54	; 84	'T'
	.db #0x48	; 72	'H'
	.db #0x58	; 88	'X'
	.db #0x10	; 16
	.db #0x30	; 48	'0'
	.db #0xe8	; 232
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0x3c	; 60
	.db #0x14	; 20
	.db #0x74	; 116	't'
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x0e	; 14
	.db #0x0e	; 14
	.db #0x09	; 9
	.db #0x0b	; 11
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0xb8	; 184
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0x24	; 36
	.db #0xf4	; 244
	.db #0xd4	; 212
	.db #0xf4	; 244
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x11	; 17
	.db #0x19	; 25
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x14	; 20
	.db #0x08	; 8
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0a	; 10
	.db #0x0a	; 10
	.db #0x06	; 6
	.db #0x06	; 6
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x02	; 2
	.db #0x02	; 2
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0x98	; 152
	.db #0x08	; 8
	.db #0xb8	; 184
	.db #0x18	; 24
	.db #0xf8	; 248
	.db #0xe4	; 228
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0x7e	; 126
	.db #0x12	; 18
	.db #0xf6	; 246
	.db #0x9c	; 156
	.db #0xfc	; 252
	.db #0x14	; 20
	.db #0xf4	; 244
	.db #0x78	; 120	'x'
	.db #0xf8	; 248
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x1d	; 29
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x27	; 39
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7e	; 126
	.db #0x48	; 72	'H'
	.db #0x6f	; 111	'o'
	.db #0x39	; 57	'9'
	.db #0x3f	; 63
	.db #0x28	; 40
	.db #0x2f	; 47
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x01	; 1
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0xf0	; 240
	.db #0xf0	; 240
	.db #0x50	; 80	'P'
	.db #0x50	; 80	'P'
	.db #0x60	; 96
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0x40	; 64
	.db #0x40	; 64
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x19	; 25
	.db #0x10	; 16
	.db #0x1d	; 29
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x18	; 24
	.db #0x1f	; 31
	.db #0x24	; 36
	.db #0x2f	; 47
	.db #0x2b	; 43
	.db #0x2f	; 47
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x88	; 136
	.db #0x98	; 152
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x28	; 40
	.db #0x10	; 16
	.db #0x90	; 144
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xe0	; 224
	.db #0x70	; 112	'p'
	.db #0x70	; 112	'p'
	.db #0x90	; 144
	.db #0xd0	; 208
	.db #0x20	; 32
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x2f	; 47
	.db #0x20	; 32
	.db #0x2f	; 47
	.db #0x10	; 16
	.db #0x1f	; 31
	.db #0x08	; 8
	.db #0x0f	; 15
	.db #0x16	; 22
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x28	; 40
	.db #0x2f	; 47
	.db #0x1e	; 30
	.db #0x1f	; 31
	.db #0x09	; 9
	.db #0x0f	; 15
	.db #0x09	; 9
	.db #0x09	; 9
	.db #0x07	; 7
	.db #0x07	; 7
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xf4	; 244
	.db #0x04	; 4
	.db #0xf4	; 244
	.db #0x08	; 8
	.db #0xf8	; 248
	.db #0x10	; 16
	.db #0xf0	; 240
	.db #0x68	; 104	'h'
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xfc	; 252
	.db #0x24	; 36
	.db #0xec	; 236
	.db #0x38	; 56	'8'
	.db #0xf8	; 248
	.db #0xe0	; 224
	.db #0xe0	; 224
	.db #0xc0	; 192
	.db #0xc0	; 192
__xinit__vram:
	.dw #0x8000
__xinit__pallets:
	.dw #0x9000
__xinit__tilemap:
	.dw #0x9800
__xinit__InputData:
	.dw #0xff00
__xinit__spriteAttributes:
	.dw #0xfe00
__xinit__requestData:
	.dw #0x0020
__xinit__UpPressed:
	.db #0x00	;  0
__xinit__DownPressed:
	.db #0x00	;  0
__xinit__LeftPressed:
	.db #0x00	;  0
__xinit__RightPressed:
	.db #0x00	;  0
__xinit__counter:
	.dw #0x0000
	.area _CABS (ABS)
