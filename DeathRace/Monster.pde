class Monster {
  PVector position = new PVector(width/2, height/2);
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
      gHit++;
    }
  }

  void move() {
    int shouldChange = (int)random(1, 40);
    if (shouldChange==3) {
      direction = (int)random(0, 5);
    }
    if (direction==1) {
      if (position.y-velocity>20) {
        position.y-=velocity;
      }
    } else if (direction==2) {
      if (position.x+velocity<width-16) {
        position.x+=velocity;
      }
    } else if (direction==3) {
      if (position.y+velocity<height-20) {
        position.y+=velocity;
      }
    } else if (direction==4) {
      if (position.x-velocity>16) {
        position.x-=velocity;
      }
    }
  }
}
