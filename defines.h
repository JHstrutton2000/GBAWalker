//memory locations
#define VRAM                0x8000
#define PALLETS             0x9000
#define TILEMAPS            0x9800
#define SRAM				0xA000
#define RAM					0xC000
#define IO				    0xFF00
#define spriteAttributes    0xFE00
#define requestData         0x0020

#define PlayerSpritesBank 0

//locations of tiles loaded into vram
#define backwardStill   0x01
#define leftStill       0x05
#define rightStill      0x09
#define forwardStill    0x0D

#define backwardWalk    0x11
#define leftWalk        0x19
#define rightWalk       0x21
#define forwardWalk     0x29

#define Enemyright      0x2C
#define Enemyleft       0x2E
#define Enemyforward    0x30
#define Enemybackward   0x32

#define emptyTile        0xFE

//directions
#define none	 0x00
#define backward 0x01
#define left	 0x02
#define forward  0x03
#define right    0x04

#define playerSpeed 3
#define enemySpeed  1
#define enemyAcc    1
#define enemyAttackRadius 2

#define charOffset 0x20