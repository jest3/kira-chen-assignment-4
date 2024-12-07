class Player {

  //variables to control movemenet
  PVector acceleration;
  boolean pressingUp;

  //constructor
  Player() {
    //makes movement feel less static
    acceleration = new PVector (0, 0.5);
  }

  void display() {
    //drawing player
    noStroke();
    fill(#FF03D6);
    rect (playerPosition.x, playerPosition.y, playerSize.x, playerSize.y);
    fill(0);
    ellipseMode(CENTER);
    //ensures drawing of player updates with position
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

//checks if up arrow is pressed, moves player up as if jumping if key is pressed
//if up arrow is not being pressed player position is unaffected, seeming like the player falls
  void move() {
    if (pressingUp == true) {
      playerVelocity.y = -10;
    }
    //adds acceleration to player movement
    playerVelocity.y += acceleration.y;
    playerPosition.add(playerVelocity);
  }

//checks if up arrow is pressed
//pressingUp boolean = true
  void keyPressed() {
    if (keyCode == UP) {
      pressingUp = true;
    }
  }

//checks if up arrow is released
//pressingUp boolean = false
  void keyReleased() {
    if (keyCode == UP) {
      pressingUp = false;
    }
  }
}
