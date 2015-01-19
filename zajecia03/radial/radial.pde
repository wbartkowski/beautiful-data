import processing.pdf.*;

Table people;
Table links;

void setup(){
  //size(1440,600,PDF,"output.pdf");
  size(800,800);
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
  translate(width/2.0,height/2.0);
  noStroke();
  float tSize = 6; //(width+0.0)/people.getRowCount();
  float radius=300;
  textSize(tSize);
  for(int i=0;i<people.getRowCount();i++){
    pushMatrix();
    rotate(radians(i*(360.0/people.getRowCount())));
    translate(radius,0);  
    //rotate(PI/2.0);
    text(people.getString(i,1),0,0);
    popMatrix();
  }
  noFill();
  stroke(0,10);
  for(int i=0;i<links.getRowCount();i++){
    int linkFrom = links.getInt(i,0);
    int linkTo = links.getInt(i,1);
    bezier(linkFrom*tSize+tSize/2.0, 550, linkFrom*tSize+tSize/2.0, 0, linkTo*tSize+tSize/2.0, 0, linkTo*tSize+tSize/2.0, 550);
  }
  //exit();
}
