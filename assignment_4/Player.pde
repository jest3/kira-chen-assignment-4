class Player {

  //variables to control movemenet
  PVector position, velocity, acceleration;
  boolean pressingUp;

  //constructor
  Player() {
    position = new PVector (50, 260);
    velocity = new PVector (0, 0);
    acceleration = new PVector (0, 0.5);
  }

  void display() {
    //drawing player
    noStroke();
    fill(#FF03D6);
    rect (position.x, position.y, playerSize.x, playerSize.y);
  }

  void move() {
    if (pressingUp == true) {
      velocity.y = -10;
    }
    velocity.y += acceleration.y;
    position.add(velocity);
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
