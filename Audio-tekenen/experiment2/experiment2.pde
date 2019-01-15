import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput input;
FFT fft;

void setup() {
  size(450,350);
  background(0);
  smooth();
  noFill();
  noCursor();
  
  minim = new Minim(this);
  input = minim.getLineIn(Minim.MONO);
}

void draw() {
  noStroke();
  // fade
  fill(0,9);
  rect(0,0,width,height);
  // Ellipse
  //stroke(255);
  //noFill();
  //ellipse(mouseX, mouseY, 50, 90);
   
   for(int i = 0; i < input.bufferSize() -1; i++)
  {    
    fill(255);
    ellipse(mouseX,mouseY,input.right.get(i)*2000,input.right.get(i)*2000);
  }
  
}
