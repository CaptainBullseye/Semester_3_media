import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput input;
FFT fft;

void setup() {
size (540, 670);
noCursor();

minim = new Minim(this);
input = minim.getLineIn(Minim.MONO);
}

void draw(){
  background(0);
  noFill();
  
  for(int i = 0; i < input.bufferSize() -1; i++)
  {
    stroke(255);

    ellipse(width/2,height/2,input.right.get(i)*4000,input.right.get(i)*4000);

  }
}
