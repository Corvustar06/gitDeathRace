class Monster {
  //ghosts start in the middle of the screen
  PVector position = new PVector(width/2, height/2);
  boolean collision=false;
  int direction=0;
  float velocity =2.5; //the speed that the ghosts move at

//places the appropriate sized ghost image and calls to move it accordingly
  void drawGhost() {
    move();
    ghost.resize(32, 40);
    image(ghost, position.x, position.y);
  }

  void checkCollision(Car c) {
    //checks the distance between the ghost's center point and the car's center point
    if (dist(c.position.x, c.position.y, position.x, position.y)<=35) {
      //if the ghost has been hit
      collision=true;
      //create a new grave in its place
      graves.add(new Gravestone(position.x, position.y));
      //repawn the ghost along the outer borders
      position = new PVector(random(0, 100), random(0, height));
      //blocks the car
      c.blocked=true;
      //increases the score
      gHit++;
    }
  }

  void move() {
    //1/40 random chance of the changing direction of movement
    int shouldChange = (int)random(1, 40);
    if (shouldChange==3) {
      //if the direction is changing, what is it changing to?
      direction = (int)random(0, 5);
    }
    //north
    if (direction==1) {
      //if it doesn't leave the on-screen boudries
      if (position.y-velocity>20) {
        position.y-=velocity;
      }
      //east
    } else if (direction==2) {
      if (position.x+velocity<width-16) {
        position.x+=velocity;
      }
      //south
    } else if (direction==3) {
      if (position.y+velocity<height-20) {
        position.y+=velocity;
      }
      //west
    } else if (direction==4) {
      if (position.x-velocity>16) {
        position.x-=velocity;
      }
    }
  }
}
