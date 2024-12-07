class Lines {
  
  PVector position;
  float rectWidth;
  float speed;
  
  //constructor
  Lines(){
   position = new PVector (random(500, 800), random (0, 290));
   rectWidth = random (10, 30);
   speed = random(8, 15);
  }
  
  void display(){
   fill(#811476);
   noStroke();
   rect(position.x, position.y, rectWidth, 3);
  }
  
  void move(){
    position.x -= speed;
    
    if (position.x < 30) {
    position = new PVector (random(500, 800), random (0, 290));
    rectWidth = random (10, 30);
    speed = random(8, 15);
    }
  }
  
}
