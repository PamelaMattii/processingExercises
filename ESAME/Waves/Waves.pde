//IMPORTO LA LIBRERIA, DICHIARO LE VARIABILI E L'IMMAGINE.
import controlP5.*;
ControlP5 cp5;
//QUESTA VARIABILE SERVIRA' PER CAMBIARE EFFETTO
boolean change = false;

PImage hex;

int type;
//ARRAY DI 3 OGGETTI(COLORI) PER LE ONDE. 
int colors[] = {
  color(255,0,0), 
  color(0,255,0), 
  color(0,0,255)
  };
 
void setup()
{
  size(800,800);
  type = 0;  
  //CARICO L'IMMAGINE, INIZIALIZZO E POSIZIONO IL BOTTONE "CHANGE"
  hex = loadImage("hex.png");
 
  cp5 = new ControlP5(this);
  cp5.addToggle("change")
     .setPosition(30,100)
     .setSize(50,20)
     ;
      
}


void draw()
{
 blendMode(BLEND);
 
//EFFETTO TRA BACKGROUND E LE ONDE. 
 if(type == 0)
 {
  background(255); 
  blendMode(EXCLUSION); //SOTTRAGGO COLORE ALLO SFONDO
 }
 else
 {
   background(0);
   blendMode(SCREEN); //MOLTIPLICA I VALORI INVERSI DEI COLORI
 }
 noFill();
 strokeWeight(20);

//ITERO E INIZIALIZZO LA FORMA
 for(int i = 0; i < 3; i++)
 {
  stroke(colors[i]);
  beginShape();

//ITERO E STABILISCO FREQUENZA, LUNGHEZZA DELLE ONDE 
  for(int w = -20; w < width + 20; w += 5)
  {
   int h = height/2 ; 
   //frequenza delle onde, lughezza d'onda. 
   h += 200 * sin(w* 0.03 + frameCount* 0.07 + i* TWO_PI /3) *
   pow(abs(sin(w* 0.02 + frameCount* 0.02)), 5);
   curveVertex(w, h);
  }
  endShape();
 }

//MODIFICO IL BACKGROUND E LE ONDE CON IL BUTTON "CHANGE"
 if(change==true)
  {  
   background(hex);
   
   blendMode(SCREEN);
   for(int i = 0; i < 3; i++)
   {
    stroke(colors[i]);
    beginShape();
    
    for(int w = -20; w < width + 20; w += 5)
    {
     int h = height/2 ; 
     h += 200 * sin(w* 0.03 + frameCount* 0.07 + i* TWO_PI /3) *
     pow(abs(sin(w* 0.001 + frameCount* 0.02)), 5);
     curveVertex(w, h);
    }
     endShape();
   }
  }
  
}

  
//CON UN CLICK DEL MOUSE CAMBIO IL BACKGROUND
void mousePressed()
{
 if(type == 0)
 {
  type = 1;
 }
 else
 {
  type = 0; 
 }
}
