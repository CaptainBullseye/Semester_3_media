import ddf.minim.analysis.*;
import ddf.minim.*;

Minim minim;
AudioPlayer jingle;
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
  stroke(255,255,255);

  fft.forward(input.mix);
  
  for(int i = 0; i < fft.specSize(); i++)
  {

    ellipse(i, height/2, 1,fft.getBand(i)*100);
    
  }
  
}
