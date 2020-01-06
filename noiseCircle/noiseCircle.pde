int nPoints = 360;
float angle;
float radius = 200;
float moving = 0;

void setup()
{
  size(800,800,P2D);
  smooth(8);
  noFill();
  strokeWeight(5.3);
  background(11,66,244);
}

void draw()
{
  background(11,66,244);
  moving += 1;
  pushMatrix();
  // applicare modifiche alla matrice di traslazione
  translate(width/2, height/2);
  //rotate(millis()/300);
  stroke(255,0,0, 50);
  
  beginShape();
  for(int i = 0; i < nPoints; i++)
  {
    angle = map(i, 0, nPoints, 0, TWO_PI);
    float x = cos(angle) * radius;
    float y = sin(angle) * radius;
    PVector v = new PVector(x,y);
    x = (x + moving) / 250;
    y = (y + moving) / 300;
    v.mult(noise(x,y));
    noFill();
    stroke(255,0,0);
    vertex(v.x, v.y, 10, 10);
  }
  endShape();
  popMatrix();

}

void keyReleased()
{
  if(key == ' ')
  {
    saveFrame();
  }
}