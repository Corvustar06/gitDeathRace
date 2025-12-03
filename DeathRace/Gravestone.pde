class Gravestone{
  PVector position;
  Gravestone(float x,float y){
    position = new PVector(x,y);
  }
  void drawGrave(){
    fill(230);
    noStroke();
    rect(position.x-10,position.y-20,position.x+10,position.y+20);
  }
}
