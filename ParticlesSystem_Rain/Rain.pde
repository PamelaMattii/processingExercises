class Rain 
{
  //DICHIARAZIONE
  PVector posD;
  PVector velD;
  int sizeD;
  color colD;
  
   
Rain()
 {
   posD = new PVector(800, 0);
   velD = new PVector(0, random(-5.5));
   sizeD = (int)random(5,10);
   colD = color(158, 184, 245, 255);
   
   println("pos:" , posD, "vel:", velD, "size:", sizeD, "col:", colD);
 }
    
//void move()
//  {
//   posD.add(velD);    
//  }  
  
  
  
void checkborderD()
{
  if(posD.y >= (height-sizeD/2) || posD.y <= sizeD/2)
  {
    velD.y *= -1;
  }  
}
  
  
}
