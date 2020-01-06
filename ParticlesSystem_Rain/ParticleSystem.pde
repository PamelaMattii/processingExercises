class ParticleSystem 
{
  //DICHIARAZIONE
  PVector pos;
  PVector vel;
  int size;
  color col;
  float alpha = 255;
   
  //COSTRUTTORE: dove costruisco l'oggetto della nuova classe
ParticleSystem()
 {
   pos = new PVector(mouseX, mouseY);
   vel = new PVector(random(-5,5), random(-5.5));
   size = (int)random(5,50);
   col = color(random(255), random(255), random(255), alpha);
   
   println("pos:" , pos, "vel:", vel, "size:", size, "col:", col);
 }
  
  //METODI: funzioni appartenenti alla classe
void move()
  {
   pos.add(vel);    
  }

//DEFINISCO UNA FUNZIONE TIPO FLOAT CHE MI RESTITUISCE UN VALORE TIPO FLOAT 
float fadeOut()
{
  alpha -= 1.5;
  
  if(alpha <= 0)
  {
   alpha = 0; 
  }
  //println("alpha:", alpha);
  return alpha;
}
  
  
void checkborder()
{
  if(pos.x >= (width-size/2) || pos.x <= size/2)
  {
   vel.x *= -1;
  }
  
  if(pos.y >= (height-size/2) || pos.y <= size/2)
  {
    vel.y *= -1;
  }  
}
  


}
