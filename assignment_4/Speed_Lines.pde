class Lines {
  
  PVector position;
  float rectWidth;
  float speed;
  
  //constructor
  Lines(){
   position = new PVector (random(500, 800), random (0, 290));
   rectWidth = random (30, 50);
   speed = random(5, 10);
  }
  
  //draws lines
  void display(){
   fill(#811476);
   noStroke();
   rect(position.x, position.y, rectWidth, 3);
  }
  
  //moves lines from right to left of screen
  //resets position, speed, and size once lines are off the left of the screen so that the lines return
  void move(){
    position.x -= speed;
    
    if (position.x < -50) {
    position = new PVector (random(500, 800), random (0, 290));
    rectWidth = random (30, 50);
    speed = random(8, 15);
    }
  }
  
}
