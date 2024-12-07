class Obstacle {
  float speed;
  PVector position;

  Obstacle() {
    speed = random(5, 20);
    position = new PVector (500, 300 - obstacleSize.y);
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
      obstacleSize = new PVector (random(20, 60), random(20, 200));
      position.x = 500;
      position.y = 300 - obstacleSize.y;
      speed = random (5, 10);
    }
  }
}
