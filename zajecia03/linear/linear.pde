import processing.pdf.*;

Table people;
Table links;

void setup(){
  size(1440,600,PDF,"output.pdf");
  //size(1440,600);
  people = loadTable("people.csv");
  links = loadTable("links.csv");
  for(int i=0;i<links.getRowCount();i++){
    String linkFrom = links.getString(i,0);
    String linkTo = links.getString(i,1);
    for(int j=0;j<people.getRowCount();j++) 
    {
      if(people.getString(j,0).equals(linkFrom)){
        links.setInt(i,0,j);
       //println(links.getInt(i,0));
      }
      else if(people.getString(j,0).equals(linkTo)){
        links.setInt(i,1,j);
      }
    }
  }
  //noLoop();
}
void draw(){
  background(255);
  fill(0);
  strokeWeight(0.5);
  noStroke();
  float tSize = (width+0.0)/people.getRowCount(); 
  textSize(tSize);
  for(int i=0;i<people.getRowCount();i++){
    pushMatrix();
    translate(i*tSize,300);  
    rotate(PI/2.0);
    text(people.getString(i,1),0,0);
    popMatrix();
  }
  noFill();
  stroke(0,10);
  for(int i=0;i<links.getRowCount();i++){
    int linkFrom = links.getInt(i,0);
    int linkTo = links.getInt(i,1);
    bezier(linkFrom*tSize+tSize/2.0, 300, linkFrom*tSize+tSize/2.0, 0, linkTo*tSize+tSize/2.0, 0, linkTo*tSize+tSize/2.0, 300);
  }
  exit();
}
