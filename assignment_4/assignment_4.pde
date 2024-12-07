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
float obstacleSpeed = 5;

//sets timer to 30 seconds
int timer = 30;
int frameRate = 60;

//checked to trigger game over or win screen
boolean gameOver;
boolean gameWin;

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

  //timer function
  timer();

  //if timer reaches 0, gameWin is true and displays win screen
  if (gameWin && gameOver == false) {
    gameWin();
  }

  //if collision between player and obstacles is detected and gameOver is true display loss screem
  if (gameOver && gameWin == false) {
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

//timer function
void timer() {
  //decreases timer by 1 every 60 frames
  if (frameCount % frameRate == 0 && gameOver == false && gameWin == false) {
    timer--;
  }
  //if timer reaches 0 win condition is reached
  if (timer <= 0 && gameOver == false) {
    gameWin = true;
    gameOver = false;
  }
}

//displays winn screen
void gameWin() {
  stroke(#00FF30);
  fill(0);
  rect (0, 0, width, height);
  //display "Win" text on screen
  fill(#00FF30);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("WIN", width/2, height/2);
  textSize(32);
  text("Click to reset", width/2, 290);

  obstaclePosition.x = 200;

  if (mousePressed) {
    reset();
  }
}

//displays game over screen
void gameOver() {
  stroke(#FF0000);
  fill(0);
  rect (0, 0, width, height);
  //display "Game Over" text on screen
  fill(#FF0000);
  textSize(60);
  textAlign(CENTER, CENTER);
  text("GAME OVER", width/2, height/2);
  textSize(32);
  text("Click to reset", width/2, 290);

  obstaclePosition.x = 200;

  if (mousePressed) {
    reset();
  }
}

//
void reset() {
  if (gameWin == true && mousePressed){
  gameWin = false;
  gameOver = false;
  timer = 30;

  obstacleSize = new PVector (random (20, 60), random (20, 200));
  obstaclePosition = new PVector (500, 300 - obstacleSize.y);
  obstacleSpeed = 5;
  playerPosition = new PVector (50, 260);

  frameCount = 0;
  }
  
  if (gameOver == true && mousePressed){
  gameWin = false;
  gameOver = false;
  timer = 30;

  obstacleSize = new PVector (random (20, 60), random (20, 200));
  obstaclePosition = new PVector (500, 300 - obstacleSize.y);
  obstacleSpeed = 5;
  playerPosition = new PVector (50, 260);
  }
}
