//Kira Chen
//assignment 4

//global variables for player and obstacles
//allows for collision to be detected in main code
PVector playerSize = new PVector (30, 40);
PVector playerPosition = new PVector (50, 260);
//honestly I didn't need to put the player velocity here, I just did and don't feel like changing it
PVector playerVelocity = new PVector (0, 0);

PVector obstacleSize = new PVector (random (20, 60), random (20, 200));
PVector obstaclePosition = new PVector (500, 300 - obstacleSize.y);

//checked to trigger game over screen
boolean gameOver;

Player player;
Obstacle obstacle;

void setup() {
  size (400, 400);

  player = new Player();
  obstacle = new Obstacle ();
}

void draw() {
  //background
  background(#13021F);

  //ground
  stroke(#03C6FF);
  strokeWeight(3);
  fill(0);
  rect(0, 300, 398, 138);

//displays and moves player
//ensures player stays above ground level
  player.display();
  player.move();
  player.groundCollision();

//checks for player and obstacle collision
  obstacleCollision();

//displays and moves obstacles
  obstacle.display();
  obstacle.move();

//if collision between player and obstacles is detected and gameOver is true display game over screem
  if (gameOver == true) {
    gameOver();
  }
}

//calls keyPressed and keyReleased functions in player class
void keyPressed() {
  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}

//checks if collision occurs between the player and obstacles
//if detected, changes game over boolelan to true
void obstacleCollision() {
  if (playerPosition.x < obstaclePosition.x + obstacleSize.x &&
    playerPosition.x + playerSize.x > obstaclePosition.x &&
    playerPosition.y < obstaclePosition.y + obstacleSize.y &&
    playerPosition.y + playerSize.y > obstaclePosition.y) {
    gameOver = true;
  }
}

//displays game over screen
void gameOver() {
  fill(#FF0303);
  rect (width/2, height/2, 50, 50);
}
