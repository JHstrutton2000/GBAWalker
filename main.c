#include "defines.h"

#include <gb/gb.h>
#include <stdio.h>
#include <string.h>
#include "sprites.c"


BOOLEAN UpPressed = 0;
BOOLEAN DownPressed = 0;
BOOLEAN LeftPressed = 0;
BOOLEAN RightPressed = 0;

BOOLEAN Walking = 0;

uint8_t playerDir = backward;

int counter = 0;

void main(){
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
        if(playerDir == backward) {
            if(counter < 5 || !Walking)
                shadow_OAM[0].tile = backwardStill;
            else
                shadow_OAM[0].tile = backwardWalk;
        }
        else if(playerDir == left) {
            if(counter < 5 || !Walking)
                shadow_OAM[0].tile = leftStill;
            else
                shadow_OAM[0].tile = leftWalk;
        }
        else if(playerDir == right) {
            if(counter < 5 || !Walking)
                shadow_OAM[0].tile = rightStill;
            else
                shadow_OAM[0].tile = rightWalk;
        }
        else if(playerDir == forward) {
            if(counter < 5 || !Walking)
                shadow_OAM[0].tile = forwardStill;
            else
                shadow_OAM[0].tile = forwardWalk;
        }
        
        if(playerDir)
            shadow_OAM[1].tile = shadow_OAM[0].tile + 1;

        if (playerDir == none && !Walking) {
            if (shadow_OAM[0].tile == forwardWalk)
                shadow_OAM[0].tile = forwardStill;
            else if (shadow_OAM[0].tile == leftWalk)
                shadow_OAM[0].tile = leftStill;
            else if (shadow_OAM[0].tile == rightWalk)
                shadow_OAM[0].tile = rightStill;
            else if (shadow_OAM[0].tile == backwardWalk)
                shadow_OAM[0].tile = backwardStill;

            shadow_OAM[1].tile = shadow_OAM[0].tile + 1;

            Walking = 0;
        }
        else {
            playerDir = none;
        }

        //0,   1,  2,  3 || 16, 17, 18, 19 down
        //4,   5,  6,  7 || 24, 25, 26, 27 left
        //8,   9, 10, 11 || 32, 33, 34, 35 right
        //12, 13, 14, 15 || 40, 41, 42, 43 up

        static uint8_t joy = 0;

        *(unsigned char*)(InputData) = requestData; //request input data
        joy = *(unsigned char*)(InputData);  //retrieve input data

        joy = joy&0x0F; //get the relevant 4 bits

        if (joypad() & J_UP)
            UpPressed = 1;
        else
            UpPressed = 0;

        if (joypad() & J_DOWN) 
            DownPressed = 1;
        else
            DownPressed = 0;

        if (joypad() & J_LEFT)
            LeftPressed = 1;
        else
            LeftPressed = 0;

        if (joypad() & J_RIGHT) 
            RightPressed = 1;
        else
            RightPressed = 0;

        if (UpPressed) {
            playerDir = forward;
            Walking = 1;
            y--;
        }
        else if (DownPressed) {
            playerDir = backward;
            Walking = 1;
            y++;
        }
        else if (LeftPressed) {
            playerDir = left;
            Walking = 1;
            x--;
        }
        else if (RightPressed) {
            playerDir = right;
            Walking = 1;
            x++;
        }
        else
            Walking = 0;

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