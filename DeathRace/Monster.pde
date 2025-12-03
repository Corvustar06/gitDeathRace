class Monster {
  PVector position = new PVector(200, 200);
  boolean collision=false;
  int direction=0;
  float velocity =2.5;

  void drawGhost() {
    move();
    ghost.resize(32, 40);
    image(ghost, position.x, position.y);
  }

  void checkCollision(Car c) {
    if (dist(c.position.x, c.position.y, position.x, position.y)<=35) {
      collision=true;
      graves.add(new Gravestone(position.x, position.y));
      position = new PVector(random(0, 100), random(0, height));
      c.blocked=true;
    }
  }

  void move() {
    int shouldChange = (int)random(1, 3);
    if (shouldChange==3) {
      direction = (int)random(1, 4);
    }
    if (direction==1) {
      position.y-=velocity;
    } else if (direction==2) {
      position.x+=velocity;
    } else if (direction==3) {
      position.y+=velocity;
    } else if (direction==4) {
      position.x-=velocity;
    }
  }
}
