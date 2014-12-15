int val1 = 20;
int val2 = 80;

void setup()
{
  size(500,600);
  rectMode(CENTER);
  textSize(32);
}
void draw()
{
  background(255);
  fill(200,0,0);
  noStroke();
  //numbers
  text(val1, 125,100);
  text(val2, 375, 100);
  
  rect(125, 300, val1, val1);
  rect(375, 300, val2, val2);

  rect(125, 500, sqrt(val1),sqrt(val1));
  rect(375, 500, sqrt(val2),sqrt(val2));
}
