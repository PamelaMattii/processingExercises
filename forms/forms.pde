//frameCount: contatore che incrementa consecutivamente di 1 alla velocità del frameRate
// %: modulo. Operatore che calcola il resto della divisione. 
//dichiaro array di interi e assegno i valori. Comodo per dei valori fissi come i colori.

int colors[] = {#F46324, #0111A3, #FFD65E, #00C191, #88D7D2, #538BFC, #F2E1E1, #C96FDB, #964CAA, #EDAC34, #FF66A5};
int rCol()  //dichiaro una funzione intera che deve ritornare un valore intero
{
    int index = colors[int(random(colors.length))];
    return index; //mi restituisce index, che è un colore
}

void setup()
{
  size(800,800);
}

void draw()
{
  if(frameCount % 30 == 0)
    generate();
 
 //println(frameCount);
}

void generate()
{
 background(rCol());
 
 int rnd = (int)random(8, random(8,30));
 float diag = dist(0,0, width, height);
 
 for (int i = 0; i < rnd; i++) 
 {
   float x = random(0, width);
   float y = random(0, height);
   float size = random(40,250);
   float angle = random(0,TWO_PI);
   int mode = (int)random(0,3);
   
   switch(mode)
   {
     case 0:
     stroke(rCol());
     strokeWeight(size);
     strokeCap(SQUARE);
     line(x, y, x+cos(angle)*diag, y+sin(angle)*diag); //linea che parte dal cerchio
     noStroke();
     fill(rCol());
     ellipse(x,y,size,size);
     break;
     
     case 1:
     int c1 = rCol();
     int c2 = rCol();   
     
     while (c1 == c2) 
       c2 = rCol();
       
     noStroke();
     fill(c1);
     arc(x, y, size, size, angle, angle+PI); //(x, y, width, height, start angle, stop angle, open/chord/pie)
     fill(c2);
     arc(x, y, size, size, angle+PI, angle+TWO_PI);
     break;
     
     case 2:
     pushMatrix();
     translate(x,y);
     rotate(random(0,6) * HALF_PI);
     float gap = random(30,50);
     int s = (int)random(5,16);
     float _mode = random(0,2);
     //faccio due cicli for per avere una griglia.
     for (int _x = 0; _x < rnd; _x++)
     {
      for(int _y = 0; _y < rnd; _y++)
      {
        if(_mode == 0)
          ellipse(_x*gap, _y*gap, s, s);
        else
          rect(_x*gap, _y*gap, s, s); 
      }
     }
     popMatrix();
     break;
   }
   
   
 }
}
