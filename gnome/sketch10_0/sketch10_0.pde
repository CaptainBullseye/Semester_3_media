import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

PImage d;
boolean isLoaded = false;

void setup () {
  
size(300,460);
background(0);
minim = new Minim(this);
song = minim.loadFile("woo.wav");

}

void   
mouseClicked() 
{ 
if(key=='r'){ 
      
  song.play();
d = loadImage("gnome.png");
isLoaded = true; 
    //song.rewind();
   } 
if(key=='s'){ 
d = loadImage("gnome.png");
isLoaded = true; 

   }
}
void draw() {
if(isLoaded)image(d, 0, 0);
}
