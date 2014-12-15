Table table;

void setup()
{
  size(500,400);
  table = loadTable("rambo-clean.csv");
}
void draw()
{
  background(255);
  fill(0);
  for(int i=0;i<table.getColumnCount();i++)
  {
    if(i>0)
    {
      stroke(0);
      line(100+(i-1)*100, height-table.getInt(6,i-1),100+(i)*100, height-table.getInt(6,i));
    }
    noStroke();
    rect(100+i*100-3, height-table.getInt(6,i)-3, 6, 6);
    //print(table.getString(0,i));
  }
}
