Table table;

void setup()
{
  size(500,400);
  table = loadTable("rambo-clean.csv");
}
void draw()
{
  background(255);
  fill(200,0,0,128);
  noStroke();
  for(int i=0;i<table.getColumnCount();i++)
  {
    ellipse(100+i*100, 200, table.getInt(6,i),table.getInt(6,i));
  }
}
