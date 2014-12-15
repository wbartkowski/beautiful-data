Table table;

void setup()
{
  size(420,400);
  table = loadTable("rambo-clean.csv");
}
void draw()
{
  background(255);
  fill(0);
  for(int i=0;i<table.getColumnCount();i++)
  {
    noStroke();
    rect(20+i*100-3, height-table.getInt(6,i)-3, 80, table.getInt(6,i)-3);
  }
}
