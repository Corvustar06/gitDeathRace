PImage car;
PImage ghost;
PImage groundTile;
Car c;
Monster m1, m2;
boolean newGame=true;
boolean playingGame = true;
boolean gameOver=false;
ArrayList<Gravestone> graves = new ArrayList<Gravestone>(0);
int gHit=0;
float timer =60.0;

void setup() {
  size(1080, 720);
  background(150);

  car = loadImage("car.png");
  ghost = loadImage("ghost.png");
  for (int i=0; i<100; i++) {
    groundTile = loadImage("dirt_pattern.jpg");
  }
  c= new Car();
  m1=new Monster();
  m2 = new Monster();
  frameRate = 60;
}

void draw() {
  //Draws a repeated pattern of tiled ground background
  for (int i =0; i<width; i+=108) {
    for (int j=0; j<height; j+=72) {
      groundTile.resize(108, 72);//resizes the tiles to a more appropriate size
      image(groundTile, i, j);
    }
  }
  if (playingGame) {
    drawBoarders();
    c.drawCar();
    m1.drawGhost();
    m2.drawGhost();
    m1.checkCollision(c);
    m2.checkCollision(c);
    if (graves.size()>0) {
      for (Gravestone g : graves) {
        g.drawGrave();
        g.checkCollision(c);
      }
    }
    
    timer-=0.016;
    fill(255);
    textSize(50);
    text("Score: "+gHit+"          Time left: "+nf(timer,2,2),200,100);
    if(timer<=0){
      playingGame=false;
      gameOver=true;
    }
  }
  
}
//Method to create dotted line boarded on either side of the screen
void drawBoarders() {
  noStroke();
  fill(255);
  rectMode(CORNERS);
  rect(100, 144, 115, 206);
  rect(100, 0, 115, 62);
  rect(100, 72, 115, 134);
  rect(100, 216, 115, 278);
  rect(100, 288, 115, 350);
  rect(100, 360, 115, 422);
  rect(100, 432, 115, 494);
  rect(100, 504, 115, 566);
  rect(100, 576, 115, 638);
  rect(100, 648, 115, 720);
  rect(980, 144, 965, 206);
  rect(980, 0, 965, 62);
  rect(980, 72, 965, 134);
  rect(980, 216, 965, 278);
  rect(980, 288, 965, 350);
  rect(980, 360, 965, 422);
  rect(980, 432, 965, 494);
  rect(980, 504, 965, 566);
  rect(980, 576, 965, 638);
  rect(980, 648, 965, 720);
}

void keyPressed() {
  if (keyCode==UP) {
    c.forward=true;
  }
  if (keyCode==DOWN) {
    c.back=true;
  }
  if (keyCode==RIGHT) {
    c.right=true;
  }
  if (keyCode==LEFT) {
    c.left=true;
  }
}

void keyReleased() {
  if (keyCode==UP) {
    c.forward=false;
  }
  if (keyCode==DOWN) {
    c.back=false;
  }
  if (keyCode==RIGHT) {
    c.right=false;
  }
  if (keyCode==LEFT) {
    c.left=false;
  }
}
