#include <gb/gb.h>
#include <stdio.h>
#include <string.h>

#include "sprites.c"

const uint8_t *vram             = (uint8_t *)0x8000;
const uint8_t *pallets          = (uint8_t *)0x9000;
const uint8_t *tilemap          = (uint8_t *)0x9800;
const uint8_t *InputData        = (uint8_t *)0xFF00;
const uint8_t *spriteAttributes = (uint8_t *)0xFE00;

const uint8_t *requestData      = (uint8_t *)0x0020;

BOOLEAN UpPressed    = 0;
BOOLEAN DownPressed  = 0;
BOOLEAN LeftPressed  = 0;
BOOLEAN RightPressed = 0;

int counter = 0;

void main(){
	SPRITES_8x16;

    disable_interrupts();
    DISPLAY_OFF;
    LCDC_REG = 0x47;
    BGP_REG = OBP0_REG = OBP1_REG = 0xE4U;

    memcpy(vram, PlayerSprites, sizeof(PlayerSprites));
    
    DISPLAY_ON;
    enable_interrupts();

	SHOW_SPRITES;

    while(1){
        //if(playerDir != prevplayerDir){
            if(playerDir == backward) {//0, 1, 2, 3 || 16, 17, 18, 19 down
                if(counter < 5){
                    shadow_OAM[0].tile = 1;
                    shadow_OAM[1].tile = 2;
                }
                else{
                    shadow_OAM[0].tile = 17;
                    shadow_OAM[1].tile = 18;
                }
            }
            else if(playerDir == left) {//4, 5, 6, 7 || 24, 25, 26, 27 left
                if(counter < 5){
                    shadow_OAM[0].tile = 5;
                    shadow_OAM[1].tile = 6;
                }
                else{
                    shadow_OAM[0].tile = 25;
                    shadow_OAM[1].tile = 26;
                }
            }
            else if(playerDir == right) {//8, 9, 10, 11 || 32, 33, 34, 35 right
                if(counter < 5){
                    shadow_OAM[0].tile = 9;
                    shadow_OAM[1].tile = 10;
                }
                else{
                    shadow_OAM[0].tile = 33;
                    shadow_OAM[1].tile = 34;
                }
            }
            else if(playerDir == forward) {//12, 13, 14, 15 || 40, 41, 42, 43 up
                if(counter < 5){
                    shadow_OAM[0].tile = 13;
                    shadow_OAM[1].tile = 14;
                }
                else{
                    shadow_OAM[0].tile = 41;
                    shadow_OAM[1].tile = 42;
                }
            }

            //0,   1,  2,  3 || 16, 17, 18, 19 down
            //4,   5,  6,  7 || 24, 25, 26, 27 left
            //8,   9, 10, 11 || 32, 33, 34, 35 right
            //12, 13, 14, 15 || 40, 41, 42, 43 up

            playerDir = prevplayerDir;
        //}

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

        if(UpPressed){
            playerDir = forward;
            y--;
        }
        else if(DownPressed){
            playerDir = backward;
            y++;
        }
        else if(LeftPressed){
            playerDir = left;
            x--;
        }
        else if(RightPressed){
            playerDir = right;
            x++;
        }
        
        // if(arrowDown == 1 && playerDir == forward)
        //     y--;
        // if(arrowDown == 1 && playerDir == backward)
        //     y++;
        // if(arrowDown == 1 && playerDir == right)
        //     x--;
        // if(arrowDown == 1 && playerDir == left)
        //     x++;
            
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