class Gravestone {
  PVector position;
  Gravestone(float x, float y) {
    position = new PVector(x, y);
  }
  void drawGrave() {
    fill(204);
    noStroke();
    rect(position.x-5, position.y, position.x+5, position.y-50);
    rect(position.x-15, position.y-30, position.x+15, position.y-40);
    fill(121);
    rect(position.x-20, position.y+5, position.x+20, position.y-10);
  }

  void checkCollision(Car c) {
    if (dist(c.position.x, c.position.y, position.x, position.y-25)<40) {
      c.blocked=true;
    }
  }
}
