#include "defines.h"
#include <gb/gb.h>
#include <stdio.h>
#include <string.h>

static int y = 60; //coordinates
static int x = 60;
int counter = 0;

#include "controls.c"
#include "sprites.c"

void main(void){
	SPRITES_8x16;

    disable_interrupts();
    DISPLAY_OFF;
    LCDC_REG = 0x47;
    BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;

    memcpy((void*)vram, PlayerSprites, sizeof(PlayerSprites));
    
    DISPLAY_ON;
    enable_interrupts();

	SHOW_SPRITES;

    while(1){
        updatePlayerRotation();

        HandleControls(joypad());

        shadow_OAM[0].x = x-4;
        shadow_OAM[0].y = y;

        shadow_OAM[1].x = x+4;
        shadow_OAM[1].y = y;

        if(counter >= 10)
            counter = 0;
        else
            counter++;

        wait_vbl_done();    // wait for VBlank
    }
}