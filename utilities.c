int constrain(int x, int min, int max){
    if(x > max) {
        x = max;
    }
    else if(x < min) {
        x = min;
    }
    return x;
}

void printfTileMap(char* str){
    disable_interrupts();
    DISPLAY_OFF;

    uint8_t * tiles = (uint8_t *)TILEMAPS;
    while (*str) {
        //printf("\n%x", *str++ - charOffset);
        *tiles++ = *str++ - charOffset;
    }
    
    DISPLAY_ON;
    enable_interrupts();
    return;
}

void populateTileMapsChars(){
    uint8_t * pallets = (uint8_t *)PALLETS;

    memcpy(pallets+0x10, characters, sizeof(characters));
}