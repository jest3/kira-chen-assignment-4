class Obstacle {
  float speed;

  Obstacle() {
    speed = random(5, 20);
  }

  void display() {
    stroke(#FF0303);
    strokeWeight(2);
    fill(0);
    rect(obstaclePosition.x, obstaclePosition.y, obstacleSize.x, obstacleSize.y);
  }

  void move() {
    obstaclePosition.x -= speed;
    if (obstaclePosition.x < -100) {
      obstacleSize = new PVector (random(20, 60), random(20, 200));
      obstaclePosition.x = 500;
      obstaclePosition.y = 300 - obstacleSize.y;
      speed = random (5, 15);
    }
  }
}
