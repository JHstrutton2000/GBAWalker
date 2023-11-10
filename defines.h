//memory locations
#define vram                0x8000
#define pallets             0x9000
#define tilemap             0x9800
#define InputData           0xFF00
#define spriteAttributes    0xFE00
#define requestData         0x0020

#define PlayerSpritesBank 0

//locations of tiles loaded into vram
#define backwardStill   1
#define leftStill       5
#define rightStill      9
#define forwardStill    13

#define backwardWalk    17
#define leftWalk        25
#define rightWalk       33
#define forwardWalk     41

//directions
#define none	 0x00
#define backward 0x01
#define left	 0x02
#define forward  0x03
#define right    0x04