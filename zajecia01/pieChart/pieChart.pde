Table table;
PShape knife;
float sum=0;

void setup()
{
  size(500,500);
  table = loadTable("rambo-clean.csv");
  for(int i=0;i<table.getColumnCount();i++)
  {
      sum = sum + table.getInt(6,i);
  }
  strokeCap(RECT);
}
void draw()
{
  background(255);
  float a = 0;
  for(int i=0;i<table.getColumnCount();i++)
  {
    strokeWeight(10+10*i);
    float angle = (table.getInt(6,i)/sum)*TWO_PI;
    stroke(((i+0.0)/table.getColumnCount())*255);
    arc(width/2.0, height/2.0, 200,200, a, a+angle);
    a = a + angle;
  }
}
