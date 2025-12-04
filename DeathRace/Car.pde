class Car {
  //starting position of halfway across the screen and 3/4 down
  PVector position = new PVector(width/2, 3*(height/4));
  PVector velocity = new PVector(0, 0);
  boolean left, right, forward, back=false; //car is not in motion
  //rotation of car. Starting below 0 because the car is set at default right facing
  float steering=-1.6;
  //the speed at which the car moves
  float thrust=0;
  //whether or not the car has been blocked by an obsticle
  boolean blocked =false;

  void drawCar() {

    //blocks the car if it crosses the side borders
    if (position.x<=115||position.x>=965) {
      blocked=true;
    }
    //loops the cars movement between the top and bottom
    if (position.y>height) {
      position.y=0;
    } else if (position.y<0) {
      position.y=height;
    }

//because the car can cross the borders, loops the side to side movement
    if (position.x>width) {
      position.x=0;
    } else if (position.x<0) {
      position.x=width;
    }

//if the car is moving set the thrust to where it's supposed to be
    if (forward||back) {
      if (forward) {
        thrust=5;
      }
      //movement is slower when driving backwards, also undoes blocking
      if (back) {
        thrust=-2.5;
        blocked = false;
      }
      //if the car isn't meant to be moving, don't move-resets thrust and velocity
    } else {
      thrust=0;
      velocity = new PVector (0, 0);
    }

//sets the velocity to be the speed of thrust, rotates it to move where the car is pointing
    velocity = new PVector(thrust, 0);
    velocity.rotate(steering);

//only moves the car if it's not blocked
    if (!blocked) {
      position.add(velocity);
    }

//steers the car when appropriate
    if (left==true) {
      steering-=0.05;
    }
    if (right==true) {
      steering+=0.05;
    }

//draws the car with all prior changes in mind
    imageMode(CENTER);
    pushMatrix();
    translate(position.x, position.y);
    rotate(steering);
    car.resize(77, 30);
    image(car, 0, 0);
    popMatrix();
  }
}
