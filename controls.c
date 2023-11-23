BOOLEAN Walking = 0;

uint8_t playerDir = backward;
uint8_t enemyDir = backward;

void HandleControls(int input) {

    *(unsigned char*)(IO) = requestData; //request input data

    if(running){
        switch (input)
        {
            case J_UP:
                playerDir = forward;
                playerY -= playerSpeed;
                Walking = 1;
                break;
            case J_DOWN:
                playerDir = backward;
                playerY += playerSpeed;
                Walking = 1;
                break;
            case J_LEFT:
                playerDir = left;
                playerX -= playerSpeed;
                Walking = 1;
                break;
            case J_RIGHT:
                playerDir = right;
                playerX += playerSpeed;
                Walking = 1;
                break;
            case J_A:
                break;
            case J_B:
                break;
            case J_SELECT:
                break;
            case J_START:
                break;
            
            default:
                Walking = 0;
                break;
        }
        return;
    }
    else if(input == J_START) {
        memset((void*)TILEMAPS, 0x00, 0x0C); //clear tilemap
        running = 1;
        return;
    }
}