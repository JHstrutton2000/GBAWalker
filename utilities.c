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
    char* p = (char*)PALLETS;
    char** t = (char**)TILEMAPS;

    for(int i=0; i<strlen(str); i++){
        t[i] = &p[(int)str[i] - charOffset];
    }
    
    return;
}