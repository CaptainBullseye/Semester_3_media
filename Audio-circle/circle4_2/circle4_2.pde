import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput input;
FFT fft;

void setup() {
size (540, 640);
noCursor();

minim = new Minim(this);
input = minim.getLineIn(Minim.MONO);
}

void draw(){
  background(0);
  //stroke(random(255),random(255),random(255));
  noStroke();
  //noFill();
  int r = 0; 
  int g = 0;
  int b = 0;
  
  for(int i = 0; i < input.bufferSize() -1; i++)
  {
    if(i>800)
    {
      r = 0;
      g = 255;
      b = 0;
      
      //ellipse(width/2,750,input.right.get(i)*2000,input.right.get(i)*2000);
    }
    
    if(i>=600 && i<800)
    {
      r = 255;
      g = 255;
      b = 0;
      
      //ellipse(width/2,height/2,input.right.get(i)*2000,input.right.get(i)*2000);
    }
    
    if(i<600)
    {
      r = 255;
      g = 0;
      b = 0;
      
      //ellipse(width/2,250,input.right.get(i)*2000,input.right.get(i)*2000);
    }
    
    fill(r,g,b);

    ellipse(width/2,height/2,input.right.get(i)*4000,input.right.get(i)*4000);
    r = 0;
    g = 0;
    b = 0;
  }
}
