float k = 4/5;
float i;
float e;
float c = constrain(i, 0, 10);

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput input;
FFT fft;

void setup() {
size(900,900);
smooth();

minim = new Minim(this);
input = minim.getLineIn(Minim.MONO);

background(0);

}

void draw() {   
  
noFill();
noCursor();
background(0);
translate(mouseX,mouseY);
scale(200,200);
strokeWeight(0.01);

stroke(255,0,0);


if (mousePressed == true) {
  for(int i = 0; i < input.bufferSize() -1; i++) {
    line(c-input.right.get(i)*10,c-input.right.get(i)*10,input.right.get(i)*10,input.right.get(i)*10);
    rotate(radians(i + 0.01));
  }
 
  }
}
