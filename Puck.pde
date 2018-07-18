
class Puck {
  
  //co-ordinates of the puck(ball)
  float x = width/2;
  float y = height/2;
  float xSpeed = 6;
  float ySpeed = 3;
  float r = 12;
  
  Puck() {
    reset();
  }
  
  //function for the puck when it hits the paddle
  void checkPaddleLeft(Paddle p) {
    if(y < p.y + p.h/2 && y > p.y - p.h/2 && x - r < p.x + p.w/2) {
       if(x > p.x) {  
        //xSpeed *= -1;
        float diff =  y - (p.y - p.h/2);
        float rad = radians(45);
        float angle = map(diff, 0, p.h, -rad, rad);
        xSpeed = 5 * cos(angle);
        ySpeed = 5 * sin(angle);
        x = p.x + p.w/2 + r;
      }
    }
  }
  
  void checkPaddleRight(Paddle p) {
    if(y < p.y + p.h/2 && y > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if(x < p.x) {  
        //xSpeed *= -1;
        float diff =  y - (p.y - p.h/2);
        float rad = radians(135);
        float angle = map(diff, 0, p.h, -rad, rad);
        xSpeed = 5 * cos(angle);
        ySpeed = 5 * sin(angle);
        x = p.x - p.w/2 - r;
      }
    }
  }
      
  
  
  //set speed of the puck
  void update() {
    x = x + xSpeed;
    y = y + ySpeed;
  }
  
  void reset() {
    x = width/2;
    y = height/2;
    float angle = random(-PI/4, PI/4);
    xSpeed = 5 * cos(angle);
    ySpeed = 5 * sin(angle);
    
    //its adjusting the angle of the puck
    if(random(1) < 0.5) {
      xSpeed *= -1;
    }
  }
  
  //function to manage if puck is hitting the edges 
  //of the window vertically
  void edges() {
    if(y < 0 || y > height) {
      ySpeed *= -1; 
    }
    
    if(x - r > width) {
      //ding.play();
      leftScore++;
      reset();
    }
    if(x + r < 0) {
      //ding.play();
      rightScore++;
      reset();
    }
  }
  
  //puck dimensions
  void show() {
    fill(255);
    ellipse(x, y, r*2, r*2);
  }
}
