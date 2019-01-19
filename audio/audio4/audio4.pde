import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioInput input;
FFT fft;

//de audio input:
//de audio input is alles wat je bij de geluid instellingen
//onder opnemen aan hebt staan
//bijv. stereo mix of microfoon

void setup()
{
size (540, 670);
noCursor();

minim = new Minim(this);
input = minim.getLineIn();
fft = new FFT(input.bufferSize(), input.sampleRate());
}

void draw()
{
  background(0);
  fill(255,0,0);
  stroke(255,0,0);

  fft.forward(input.mix);
  //translate(width/2, height/2);
  //rotate(radians(-30));
  for(int i = 0; i < fft.specSize(); i++)
  {
    //translate(width/2,height/2);
    rect(i, height/2, 2,fft.getBand(i)*-40);
    //rotate(radians(90.0));
    rect(i, height/2, 2,fft.getBand(i)*40);
    
  }
  
}
