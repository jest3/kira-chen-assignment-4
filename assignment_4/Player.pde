class Player {

  //variables to control movemenet
  PVector acceleration;
  boolean pressingUp;

  //constructor
  Player() {
    acceleration = new PVector (0, 0.5);
  }

  void display() {
    //drawing player
    noStroke();
    fill(#FF03D6);
    rect (playerPosition.x, playerPosition.y, playerSize.x, playerSize.y);
    fill(0);
    ellipseMode(CENTER);
    ellipse (playerPosition.x + 10, playerPosition.y + 15, 3, 15);
    ellipse (playerPosition.x + 20, playerPosition.y + 15, 3, 15);
  }

  //checks if player comes in contact with ground level
  void groundCollision() {
    if (playerPosition.y + playerSize.y > 300) {
      //ensures player position remains above ground level
      playerPosition.y = 300 - playerSize.y;
      playerVelocity.y = 0;
    }
  }

  void move() {
    if (pressingUp == true) {
      playerVelocity.y = -10;
    }
    playerVelocity.y += acceleration.y;
    playerPosition.add(playerVelocity);
  }

  void keyPressed() {
    if (keyCode == UP) {
      pressingUp = true;
    }
  }

  void keyReleased() {
    if (keyCode == UP) {
      pressingUp = false;
    }
  }
}
