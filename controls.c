BOOLEAN Walking = 0;

uint8_t playerDir = backward;

void HandleControls(int input) {
    if (input & J_UP) {
        playerDir = forward;
        Walking = 1;
        y--;
    }
    else if (input & J_DOWN) {
        playerDir = backward;
        Walking = 1;
        y++;
    }
    else if (input & J_LEFT) {
        playerDir = left;
        Walking = 1;
        x--;
    }
    else if (input & J_RIGHT) {
        playerDir = right;
        Walking = 1;
        x++;
    }
    else
        Walking = 0;
}