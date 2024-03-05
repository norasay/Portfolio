#include <stdint.h>
#include <pic32mx.h>
#include "mipslab.h" 



int getbtns(void){
    
    int val;
    val = PORTD & 0xE0;
    
    val = (val >> 5);
    return val;

}