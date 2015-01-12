//20.935821533203125,52.21013126818195,21.074695587158203,52.271728965324016
import beautifuldata.*;
import processing.pdf.*;

PShape map;
PVector miejsce = new PVector(52.231105, 21.007272);
MapUtil mu;
JSONArray json;

void setup(){
  size(1380,999, PDF, "output.pdf");
  map = loadShape("map.svg");
  mu = new MapUtil(width,height, 52.21013126818195,20.935821533203125,52.271728965324016,21.074695587158203);
  json = loadJSONArray("storyline_20150103.json");
  json = json.getJSONObject(0).getJSONArray("segments");
  //println(json);
}

void draw(){
  shape(map,0,0);
  stroke(255,0,0);
  strokeWeight(2);
  noFill();
  //PVector pozycjaNaEkranie = mu.getScreenLocation(miejsce);
  //ellipse(pozycjaNaEkranie.x, pozycjaNaEkranie.y, 10, 10);
  for(int i = 0; i<json.size();i++){
    //println("Segment: " + i);
    JSONArray activities = json.getJSONObject(i).getJSONArray("activities");
    for(int j = 0; j < activities.size(  ); j++){
      //println("Activity: "+ j);
      String type = activities.getJSONObject(j).getString("activity");
      if(type.equals("transport")){
        stroke(0,255,0);
      }
      else if(type.equals("walking")){
        stroke(255,0,0);
      }
      else 
        stroke(0,0,255);
      JSONArray trackPoints = activities.getJSONObject(j).getJSONArray("trackPoints");
      beginShape();
      for(int k = 0; k<trackPoints.size();k++){
        //println("a");
        float xGeo = trackPoints.getJSONObject(k).getFloat("lat");
        float yGeo = trackPoints.getJSONObject(k).getFloat("lon");
        //println(xGeo + "," + yGeo);
        PVector pozycjaNaMapie = new PVector(xGeo, yGeo);
        PVector pozycjaNaEkranie = mu.getScreenLocation(pozycjaNaMapie);
        
        vertex(pozycjaNaEkranie.x,pozycjaNaEkranie.y);
      }
      endShape();
    }
  }
  exit();
}
