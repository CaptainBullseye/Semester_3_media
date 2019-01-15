import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

Minim minim;
AudioPlayer song;

PImage d;


void setup () {
d = loadImage("gnome.png");
size(1000,1000);
background(0);
minim = new Minim(this);
song = minim.loadFile("woo.wav");

}

boolean isLoaded = false;
int gnomew = 299/2;
int gnomeh = 437/2;

void mousePressed() 
{ 
  
  song.rewind();
  song.play();
   
    image(d,mouseX-gnomew,mouseY-gnomeh); 
  
}
void draw() {
if(isLoaded)image(d, 0, 0);
}
