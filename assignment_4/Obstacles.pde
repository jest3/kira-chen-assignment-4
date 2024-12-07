class Obstacle {
  float speed;
  PVector position;

  Obstacle() {
    speed = random(5, 20);
    position = new PVector (500, 200);
  }

  void display() {
    stroke(#FF0303);
    strokeWeight(2);
    fill(0);
    rect(position.x, position.y, obstacleSize.x, obstacleSize.y);
  }
  
  void move() {
    position.x -= speed;
    if (position.x < -100) {
    position.x = 500;
    }
  }
}
