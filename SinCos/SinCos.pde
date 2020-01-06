/* PI GRECO il rapporto tra la lunghezza della circonferenza e quella del suo diametro, o  l'area di un cerchio di raggio  1
 * SIN COS : dato un angolo (in radianti), essi ritorneranno alla corretta posizione di x (cosine) e di y (sine) di un punto 
 * sul margine del cerchio con raggio uguale a 1.
 * RADIANTI : il rapporto tra la lunghezza dell'arco di circonferenza tracciato dall'angolo e la lunghezza del raggio di tale circonferenza
 */

float angle;

void setup()
{
 
  size(800,800);
  
}

void draw()
{
   background(0);
  angle = millis()/60;
  float x = cos(angle*0.1) * 200;
  float y = sin(angle *0.1) * 200;
  //println(angle, x);
  ellipse(x + width/2, y + height/2, 40, 40);
}