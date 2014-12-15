Table table;

void setup()
{
  table = loadTable("rambo-clean.csv");
  
  for(int i=0;i<table.getColumnCount();i++)
  {
    print(table.getString(0,i));
    print(" - liczba zabitych: ");
    println(table.getInt(6,i));
  }
}
void draw()
{

}
