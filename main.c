#include "defines.h"
#include <gb/gb.h>
#include <stdio.h> 
#include <string.h>

static int playerY = 60;
static int playerX = 60;
static int playerHealth = 10;

static int enemyX = 20;
static int enemyY = 20;

static int enemyMoveScaler = 20;
static int running = 0;

int counter = 0;

#include "utilities.c"
#include "controls.c"
#include "sprites.c"

void main(void){
	SPRITES_8x16;

    disable_interrupts();
    DISPLAY_OFF;
    LCDC_REG = 0x47;
    BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;

    memcpy((void*)VRAM, PlayerSprites, sizeof(PlayerSprites));
    memcpy((void*)(VRAM + sizeof(PlayerSprites)), Enemy, sizeof(Enemy));
    
    DISPLAY_ON;
    enable_interrupts();

	SHOW_SPRITES;


    printf("A");
    printfTileMap("abcdefghijklmnopqrstuvwxyz");

    while(1){

        updatePlayer();
        updateEnemy();

        HandleControls(joypad());

        if(counter >= 10)
            counter = 0;
        else
            counter++;

        wait_vbl_done();    // wait for VBlank
        delay(10);
    }
}