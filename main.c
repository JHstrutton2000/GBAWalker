#include "defines.h"
#include <gb/gb.h>
#include <stdio.h> 
#include <string.h>

uint8_t playerY = 60;
uint8_t playerX = 60;
int playerHealth = 10;
int playerDead = 0;

uint8_t enemyX = 20;
uint8_t enemyY = 20;
char enemyXvel = 0;
char enemyYvel = 0;

bool running = false;

uint8_t * sprites = (uint8_t *)spriteAttributes;

int counter = 0;

#include "characters.c"
#include "utilities.c"
#include "controls.c"
#include "sprites.c"

void main(void){
	SPRITES_8x16;

    printf("A");
    disable_interrupts();

    DISPLAY_OFF;
    LCDC_REG = 0x47;
    BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;

    memcpy((void*)VRAM, PlayerSprites, sizeof(PlayerSprites));
    memcpy((void*)(VRAM + sizeof(PlayerSprites)), Enemy, sizeof(Enemy));
    

    DISPLAY_ON;
    enable_interrupts();

	SHOW_SPRITES;

    printfTileMap("Press Start");


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