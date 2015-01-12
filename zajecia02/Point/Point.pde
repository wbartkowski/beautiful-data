//http://render.openstreetmap.org/cgi-bin/export?bbox=20.935821533203125,52.21013126818195,21.074695587158203,52.271728965324016&scale=40000&format=pdf
import beautifuldata.*;
MapUtil mu;
PImage map;
PVector pangenerator = new PVector(52.224238, 21.010589);

void setup() {
  size(1380,999);
  mu = new MapUtil(width,height, 52.21013126818195,20.935821533203125,52.271728965324016,21.074695587158203);
  map = loadImage("map.png");
}
void draw() {
  background(255);
  fill(255);
  image(map,0,0);
  
  PVector screenPos = mu.getScreenLocation(pangenerator);
  fill(0);
  ellipse(screenPos.x,screenPos.y,10,10);
}
