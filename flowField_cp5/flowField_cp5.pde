//IMPORTO LA LIBRERIA
import controlP5.*;

//DICHIARO L'OGGETTO DELLA LIBRERIA
ControlP5 cp5;

ParticleSystem[] particles; 
int num = 4000;
float noiseScale = 500;
float noiseStrength = 1;
boolean bChange = false;


void setup()
{
  size(1280,800);
  frameRate(30);
  noStroke();
  
  particles = new ParticleSystem[num]; 
  
  cp5 = new ControlP5(this);
  //AGGIUNGO UNO SLIDER COL QUALE MODIFICO NOISESCALE
  cp5.addSlider("noiseScale").setPosition(30,30).setRange(0,1000).setSize(100,20).setNumberOfTickMarks(5);
  cp5.addSlider("noiseStrength").setPosition(30,60).setRange(0,10).setSize(100,20).setNumberOfTickMarks(5);
  cp5.addToggle("bChange").setPosition(30,90).setSize(50,50).setValue(true);
  
  for(int i = 0; i < num; i++) 
  {
    PVector pos = new PVector(random(width), random(height), 2); 
    PVector dir = new PVector(cos(random(TWO_PI)),sin(random(TWO_PI))); 
    float speed = random(0.5, 2);
    particles[i] = new ParticleSystem(pos, dir, speed);
    
  }

}



void draw()
{
  fill(0, 7);
  noStroke();
  rect(0, 0, width, height);
  
  fill(255,0,0);
  for(int i = 0; i < particles.length; i++)
  {
   particles[i].move();
   particles[i].checkBorder();
   particles[i].colorChange();
  }
  
  
}
