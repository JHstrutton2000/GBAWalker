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
                playerAttack();
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
        printfTileMap("           ");
        running = 1;

        playerY = 60;
        playerX = 60;
        enemyX = 20;
        enemyY = 20;

        playerHealth = 10;
        playerDead = 0;
        
        return;
    }
}