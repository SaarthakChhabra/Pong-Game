import processing.sound.*;


Puck puck;

//SoundFile ding;

Paddle left;
Paddle right;

int leftScore = 0; 
int rightScore = 0;

void setup() {
  size(600, 400);
  //ding = new SoundFile(this, "ding.mp3");
  puck = new Puck();
  left = new Paddle(true);
  right = new Paddle(false);
}

void draw() {
  background(0);
  
  
  puck.checkPaddleRight(right);
  puck.checkPaddleLeft(left);
  
  left.show();
  right.show();
  left.update();
  right.update();
  
  puck.update();
  puck.edges();
  puck.show();
  
  fill(255);
  textSize(32);
  text(leftScore, 32, 40);
  text(rightScore, width-64, 40);
}

//in-built function to add keyboard functionality
//used mainly to give a smooth moment of paddles
//while holding the keys
void keyReleased() {
  left.move(0);
  right.move(0);
}

//in-built function to add keyboard functionality 
void keyPressed() {
  if(key == 'a') {
    left.move(-10);
  }
  else if(key == 'z') {
    left.move(10);
  }
  
  if(key == 'k') {
    right.move(-10);
  }
  else if(key == 'm') {
    right.move(10);
  }
}
