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

void draw()
{
  background(0);
  //stroke(0);
  noStroke();
  
  for(int i = 0; i < input.bufferSize() -1; i++)
  {    
    fill(255);
    ellipse(width/2,height/2,input.right.get(i)*4000,input.right.get(i)*4000);
  }
}
