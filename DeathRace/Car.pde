class Car{
  PVector position = new PVector(200,200);
  PVector velocity = new PVector(0,0);
  boolean left,right,forward,back=false;
  float steering=0;
  float thrust=0;
  boolean blocked =false;
  
  void drawCar(){
    
    if(position.x<=115||position.x>=965){
      blocked=true;
    }
    if(position.y>height){
      position.y=0;
    } else if(position.y<0){
      position.y=height;
    }
    
    if(position.x>width){
      position.x=0;
    }
    else if(position.x<0){
      position.x=width;
    }
    
    if(forward||back){
      if(forward){
        thrust=5;
      }
      if(back){
        thrust=-2.5;
        blocked = false;
      }
    }else{
      thrust=0;
      velocity = new PVector (0,0);
    }
    
    velocity = new PVector(thrust,0);
    velocity.rotate(steering);
    
    
    if(!blocked){
      position.add(velocity);
    }
    
    if(left==true){
      steering-=0.05;
    }
    if(right==true){
      steering+=0.05;
    }
    
    imageMode(CENTER);
    pushMatrix();
    translate(position.x,position.y);
    rotate(steering);
    car.resize(77,30);
    image(car,0, 0);
    popMatrix();
  }
  
}
