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

 //Code waarmee je de kleur van de cirkel kan veranderen
 
   for(int i = 0; i < input.bufferSize() -1; i++)
  {
    if (key == 'r'){
      
      fill(255,0,0);
      ellipse(mouseX,mouseY,input.right.get(i)*2000,input.right.get(i)*2000);
      
    }
    
     if (key == 'g'){
      
      fill(0,255,0);
      ellipse(mouseX,mouseY,input.right.get(i)*2000,input.right.get(i)*2000);
      
    }
    
     if (key == 'b'){
      
      fill(0,0,255);
      ellipse(mouseX,mouseY,input.right.get(i)*2000,input.right.get(i)*2000);
      
    }
    
     if (key == 'w'){
      
      fill(255);
      ellipse(mouseX,mouseY,input.right.get(i)*2000,input.right.get(i)*2000);
      
    }

  }
  
}
