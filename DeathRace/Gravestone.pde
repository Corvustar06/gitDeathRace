class Gravestone {
  PVector position;
  //constructor because this is the only set of variables I don't define myself
  Gravestone(float x, float y) {
    position = new PVector(x, y);
  }
  
  void drawGrave() {
    //draws a set of rectangle shapes to make a gravestone
    fill(204);
    noStroke();
    rect(position.x-5, position.y, position.x+5, position.y-50);
    rect(position.x-15, position.y-30, position.x+15, position.y-40);
    fill(121);
    rect(position.x-20, position.y+5, position.x+20, position.y-10);
  }

  void checkCollision(Car c) {
    //if the car's center position comes close enough to the grave, they collide
    if (dist(c.position.x, c.position.y, position.x, position.y-25)<40) {
      c.blocked=true;
    }
  }
}
