class Monster {
  PVector position = new PVector(200,200);
  boolean collision=false;
  
  void drawGhost() {
    ghost.resize(32, 40);
    image(ghost, position.x, position.y);
  }
  
  void checkCollision(Car c){
    if(dist(c.position.x,c.position.y, position.x,position.y)<=35){
      collision=true;
      c.blocked=true;
    }
  }
}
