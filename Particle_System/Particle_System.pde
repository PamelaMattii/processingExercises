ArrayList<PVector> pos;
ArrayList<PVector> vel;
ArrayList<PVector> size;
color col = color(random(0,255), random(0,255), random(0,255));

int d = 30;
int nMax = 200;

void setup()
{
  size(800,800);
  background(0);
  pos = new ArrayList<PVector>();
  vel = new ArrayList<PVector>();
  size = new ArrayList<PVector>();
  //println("pos size : ", pos.size());

}

void draw()
{
  background(0);
  
  for(int i = 0; i < pos.size(); i++)
  {
    PVector p = pos.get(i);
    PVector v = vel.get(i);
    PVector s = size.get(i);
    ellipse(p.x, p.y , s.x, s.x);
    
    fill(col *(i));
    p.add(v);
  }
 
}

void mouseDragged()
{
  if(mouseButton == LEFT)
  {
    PVector rndVel = new PVector(random(-3,3), random(-3,3));
    vel.add(rndVel);
    
    PVector rndPos = new PVector(mouseX, mouseY);
    pos.add(rndPos);
    
    PVector rndSize = new PVector(random(1,50), random(1,50));
    size.add(rndSize);
   
   // println("rndPos : " , rndPos, " posSize : " , pos.size())
        
  }
  
  //if(mouseButton == RIGHT)
  //{
  //  pos.clear();
  //  println("posSize : " , pos.size());
  //  background(0);
  //}
  
}
