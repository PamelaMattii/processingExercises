class ParticleSystem
{
 
  PVector pos;
  PVector dir; 
  PVector vel;
  float speed;
  int d = 1; 
  color col;
  
  
  ParticleSystem(PVector _pos, PVector _dir, float _speed ) 
 {
   pos = _pos;
   dir = _dir;
   speed = _speed;
 }
 
 void move()
 {
   float angle = noise(pos.x/noiseScale, pos.y/noiseScale, frameCount/noiseScale) *TWO_PI* noiseStrength;
   dir.x = cos(angle);
   dir.y = sin(angle);
   
   vel = dir.get();
   vel.mult(speed); 
   pos.add(vel);
   
   ellipse(pos.x, pos.y, pos.z, pos.z);
 }
 
 void checkBorder()
 {
  if(pos.x <= 0 || pos.x > width || pos.y < 0 || pos.y > height) 
  {
    pos.x = random(width);
    pos.y = random(height);
  }
 }
  
  
  void colorChange()
  {
   if(bChange==false)
   {
     background(random(255),random(255),random(255));
   }

  }

   


}
