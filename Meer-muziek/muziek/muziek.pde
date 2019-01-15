float k = 4/5;
float i;
float e;

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
fill(255);
//background(0);
translate(width/2,height/2);
scale(200,200);
strokeWeight(0.01);

float t = frameCount /10000.0;
float x1 = cos(k) * sin(t);
float y1 = cos(k) * cos(t);
float x2 = sin(e/10) + sin(e/5);
float y2 = cos(e/20) + cos(e/10);
stroke(random(255),random(255),random(255));
//stroke(255,0,0);
e++;

for(int i = 0; i < input.bufferSize() -1; i++) {
  ellipse(input.right.get(i)*10,input.right.get(i)*10,input.right.get(i)*10,input.right.get(i)*10);
  rotate(radians(i + 0.01));
  }
  
  t += 0.5;
}
