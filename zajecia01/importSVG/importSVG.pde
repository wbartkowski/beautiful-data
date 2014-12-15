Table table;
PShape knife;
float max;

void setup()
{
  size(500,400);
  table = loadTable("rambo-clean.csv");
  knife = loadShape("knife.svg");
  max = 0;
  for(int i=0;i<table.getColumnCount();i++)
  {
    if( table.getInt(6,i) > max )
    {
      max = table.getInt(6,i);
    }
  }
}
void draw()
{
  background(255);
  for(int i=0;i<table.getColumnCount();i++)
  {
    pushMatrix();
    translate(100+i*100, 200);
    scale(0.5+table.getInt(6,i)/max);
    shape(knife,-knife.width/2.0,-knife.height/2.0);
    popMatrix();
  }
}
