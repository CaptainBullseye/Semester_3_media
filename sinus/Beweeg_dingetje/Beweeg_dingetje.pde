float k = 4/5;
float i;
float e;
float c = constrain(i, 0, 10);

import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim;
AudioInput input;
FFT fft;

static final int NUM_LINES = 10;

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
translate(width/2,height/2);
scale(200,200);
strokeWeight(0.01);
//stroke(255);
float t = frameCount / 10.0;
float x1 = sin(t/10) + sin(t/5);
float y1 = cos(t/10);  
float x2 = cos(e/20) + cos(k/3);  
float y2 = cos(e/10);

float x3 = sin(t/10) - sin(t/5);
float y3 = cos(t/10);  
float x4 = cos(e/20) - cos(k/3);  
float y4 = cos(e/10); 

//stroke(random(255),random(255),random(255));
e++;

//if (mousePressed == true) {
for(int i = 0; i < NUM_LINES -1; i++) {
  stroke(255,0,0);
  line(x1,y1,x2,y2);
  
  stroke(255,255,0);
  line(x3,y3,x4,y4);
  
  rotate(radians(i + 0.01));
  }
  
  t += 0.5;
}
//}
