import ddf.minim.*;    
import ddf.minim.signals.*;    

Minim minim;
AudioOutput out;    
SineWave sine1, sine2;    
float waveH = 150;    

void setup()
{
  
  size(700, 400);
  
  
  smooth();
  minim = new Minim(this);


  out = minim.getLineOut(Minim.STEREO);

 
  sine1 = new SineWave(440, 0.5, out.sampleRate());
  sine2 = new SineWave(1000, 0.2, out.sampleRate());

  
  sine1.portamento(200);
  sine2.portamento(200);

  out.addSignal(sine1);
  out.addSignal(sine2);
}

void draw()
{
  PImage img;
  img = loadImage("4101C02F-A376-484E-A0B8-2296C6DF5E21.jpeg");
  img.resize(700, 400);
  background( img );
  stroke(100, 100, 20);
 
  for(int i = 0; i < out.bufferSize()-1; i++)
  {
    point(i, 50 + out.left.get(i)*waveH);  
    point(i, 150 + out.right.get(i)*waveH);  
  }
}

void stop()
{
  out.close();
  minim.stop();
  super.stop();
}
void mouseMoved() {
  
 
  float freq = map(mouseX, 0, width, 0, 1000);
 
  sine1.setFreq(freq);
  
 
  float amp = map(mouseY, 0, height, 0, 1.0);
 
  sine1.setAmp(amp);
}

void mousePressed() {

  float pan = map(mouseX, 0, width, -1, 1);
 
  sine1.setPan(pan);
}
