class Obstacle {

  //draws obstacles
  void display() {
    stroke(#FF0303);
    strokeWeight(2);
    fill(0);
    //keeps position consistent and randomizes obstacle size
    rect(obstaclePosition.x, obstaclePosition.y, obstacleSize.x, obstacleSize.y);
  }

  //moves obstacles from right side of screen to left
  //resets position, size and speed once off screen so it gives the illusion of different obstacles coming through
  void move() {
    obstaclePosition.x -= obstacleSpeed;
    if (obstaclePosition.x < -100) {
      obstacleSize = new PVector (random(20, 60), random(20, 300));
      obstaclePosition.x = 500;
      obstaclePosition.y = 300 - obstacleSize.y;
      obstacleSpeed = random (5, 10);
    }
  }
}
