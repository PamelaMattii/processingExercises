//DICHIARAZIONE
ArrayList<ParticleSystem> balls; //dentro ci sono tanti oggetti chiamati balls
ArrayList<Rain> drops;

void setup()
{
  size(800,800);
  //INIZIALIZZO UN ARRAYLIST DI PART.SYST.
  balls = new ArrayList<ParticleSystem>(); 
  drops = new ArrayList<Rain>();
}


void draw()
{
  background(0);
 
  
  for (int i = 0; i < balls.size(); i++) 
  {
    ParticleSystem p = balls.get(i);   
    fill(p.col, p.alpha);
    ellipse(p.pos.x, p.pos.y, p.size, p.size);
    p.move();
    p.checkborder();
    p.fadeOut(); //VALORE FLOAT
    
    if(p.fadeOut() <= 0) //RELATIVO A TUTTE LE PARTICELLE
    {
     balls.remove(p); 
    }
  }
  
  for (int i = 0; i < drops.size(); i++)
  {
   Rain d = drops.get(i);
   fill(d.colD);
   ellipse(d.posD.x, d.posD.y, d.sizeD, d.sizeD);
   d.checkborderD();
  // d.move();
  }
  
}

//OGNI VOLTA CHE PREMO UN TASTO CREO UN OGGETTO DELLA CLASSE P.S. E LO AGGIUNGO AL VETTORE DELLE BALLS
void keyPressed()
{
 if(key == '1')
 {
   ParticleSystem p = new ParticleSystem();
   balls.add(p);
   
 }
 
 if(key == '2')
 {
  Rain d = new Rain();
  drops.add(d);
 }
}

//OGNI VOLTA CHE DRAGGO CREO UN OGGETTO DELLA CLASSE P.S. E LO AGGIUNGO AL VETTORE DELLE BALLS

void mouseDragged()
{
 if(mouseButton == LEFT)
 {
   ParticleSystem p = new ParticleSystem();
   balls.add(p);
   
   //println("balls.size:", balls.size());
 }
}
