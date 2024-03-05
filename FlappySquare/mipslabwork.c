/* mipslabwork.c

   This file written 2015 by F Lundevall
   Updated 2017-04-21 by F Lundevall

   This file should be changed by YOU! So you must
   add comment(s) here with your name(s) and date(s):

   This file modified 2017-04-31 by Ture Teknolog 

   For copyright and licensing, see file COPYING */

#include <stdint.h>   /* Declarations of uint_32 and the like */
#include <pic32mx.h>  /* Declarations of system-specific addresses etc */
#include "mipslab.h"  /* Declatations for these labs */

int mytime = 0x5957;

int timeoutcount = 0;

char textstring[] = "text, more text, and even more text!";

/* Interrupt Service Routine */
void user_isr( void )
{
  return;
}





int x = 15;
int y = 5;
int z = 4;
//unsigned int clicks;
int pointcounter;

void layout(){

	//Spelet startar
  startpage();

  
	int crashchecks = 1;
	while(borderCollision(x, y) == 0){

  makeSquare(x, y, z);
	movePipe();

  if(pipeCollision(x, y) == 1){
    break;
  }
  else if(pipeCollision(x, y) == 0){
      crashchecks++;
      if(crashchecks == 128){      //när den har gått igenom displayen kommer en ny pipe     
        pointcounter++;
      }
  }


   y = Gravity(y);

	display_image(0, display);
	clear_display();

	if(getbtns() == 0x4){
    y-=3;
	}

	quicksleep(100000);
	}

	point();
	reset();

}
