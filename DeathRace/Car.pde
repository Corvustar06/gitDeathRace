class Car{
  PVector position = new PVector(100,100);
  PVector acceleration= new PVector(0,0);
  PVector velocity = new PVector(0,0);
  boolean left,right,forward,back=false;
  float steering=0.5;
  
  void drawCar(){
    if(forward){
      acceleration = new PVector(1,0);
    }else{
      acceleration = new PVector(0,0);
    }
    if(back){
      acceleration = new PVector(-1,0);
    }else{
      acceleration = new PVector(0,0);
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
