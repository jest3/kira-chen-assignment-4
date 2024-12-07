//Kira Chen
//Assignment 4

//global variables for player and obstacles
//allows for collision to be detected in main code
PVector playerSize = new PVector (30, 40);
PVector playerPosition = new PVector (50, 260);
//honestly I didn't need to put the player velocity here, I just did and don't feel like changing it
PVector playerVelocity = new PVector (0, 0);

PVector obstacleSize = new PVector (random (20, 60), random (20, 200));
PVector obstaclePosition = new PVector (500, 300 - obstacleSize.y);
//makes sure the first obstacle is never too fast
float obstacleSpeed = 5;

//sets timer to 30 seconds
int timer = 30;
int frameRate = 60;

//checked to trigger game over or win screen
boolean startScreen = true;
boolean gameOver;
boolean gameWin;

Player player;
Obstacle obstacle;
Lines lines;

void setup() {
  size (400, 400);

  player = new Player();
  obstacle = new Obstacle ();
  lines = new Lines ();
}

void draw() {
  startScreen();
  
  if (startScreen == false){
  gamePlay();
  }
}

//start screen function
void startScreen() {
  //draws start screen
  fill(0);
  rect (0, 0, width, height);
  fill(#FF00E6);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("PRESS UP ARROW KEY", width/2, 130);
  text("TO JUMP OVER", width/2, 180);
  text("OBSTACLES", width/2, 230);
  textSize(32);
  text("Press ENTER to begin", width/2, 320);
  
  //start screen disappears when enter key is pressed and gameplay begins
  //start screen is false until game is opened again, so start screen only appears once
  if (keyCode == ENTER){
    startScreen = false;
  }
}

//triggers once start screen is false
void gamePlay(){
  //background
  background(#13021F);

  //ground
  stroke(#03C6FF);
  strokeWeight(3);
  fill(0);
  rect(0, 300, 398, 138);

  //displays and moves speed lines
  lines.display();
  lines.move();
  
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
  //timer only counts down during gameplay and not after a win/loss conidtion
  if (frameCount % frameRate == 0 && gameOver == false && gameWin == false) {
    timer--;
  }

  //if timer reaches 0 win condition is reached
  //timer can't reach 0 to trigger game win if gameOver is true
  if (timer <= 0 && gameOver == false) {
    gameWin = true;
    gameOver = false;
  }
  //adds countdown timer at the corner of the screen
  fill(#FF00E6);
  textSize(32);
  textAlign(CENTER, CENTER);
  text(timer, 350, 30);
}

//displays win screen
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

  //stops the possibility of an obstacle hitting the player after game has ended
  obstaclePosition.x = 200;

  //resets game when mouse is pressed
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

  //stops the possibility of an obstacle hitting the player after game has ended
  obstaclePosition.x = 200;

  //resets game when mouse is pressed
  if (mousePressed) {
    reset();
  }
}

//
void reset() {
  //checks if mouse has been clicked after win screen to trigger reset
  if (gameWin == true && mousePressed) {
    //sets win/loss conditions to false so the win condition resets
    gameWin = false;
    gameOver = false;
    //sets timer back to 30
    timer = 30;

    //resets obstacles
    obstacleSize = new PVector (random (20, 60), random (20, 200));
    obstaclePosition = new PVector (500, 300 - obstacleSize.y);
    obstacleSpeed = 5;
    //resets the player position
    playerPosition = new PVector (50, 260);
  }

  //same idea for game over screen
  //I probably could've wrote it all in the same statement but I seperated them cause I was looking for errors
  if (gameOver == true && mousePressed) {
    gameWin = false;
    gameOver = false;
    timer = 30;

    obstacleSize = new PVector (random (20, 60), random (20, 200));
    obstaclePosition = new PVector (500, 300 - obstacleSize.y);
    obstacleSpeed = 5;
    playerPosition = new PVector (50, 260);
  }
}
