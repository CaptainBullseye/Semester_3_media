float k = 4/5;
float i;
float e;
int r = 255;
int g = 255;
int b = 255;

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput input;
FFT fft;

static final int NUM_LINES = 10;

void setup() {
size(900,900);
background(0);

minim = new Minim(this);
input = minim.getLineIn(Minim.MONO);
}

void draw() {
noFill();
//background(0);
translate(width/2,height/2);
scale(200,200);
strokeWeight(0.01);
  
if (keyPressed) {
 
  if (key == '1') {
      stroke(255,0,0);

 }
 
   if (key == '2') {
       stroke(0,255,0);
  }
 }
 
   if (key == '3') {
       stroke(0,0,255);
  }
  
  if (key == '4') {
    stroke(0,0,0,0);
  }
  
   for(int i = 0; i < input.bufferSize() -1; i++) {
    line(input.right.get(i)*10,input.right.get(i)*10,input.right.get(i)*10,input.right.get(i)*10);
    rotate(radians(i + 0.01));
  }
}
