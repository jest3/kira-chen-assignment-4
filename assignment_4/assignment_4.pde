//Kira Chen
//assignment 4

PVector playerSize = new PVector (30, 40);
PVector playerPosition = new PVector (50, 260);
PVector playerVelocity = new PVector (0, 0);

PVector obstacleSize = new PVector (random (20, 60), random (20, 200));
boolean gameOver;
boolean collision;

Player player;
Obstacle obstacle;

void setup(){
 size (400, 400); 

player = new Player();
obstacle = new Obstacle ();
}

void draw(){
  //background
  background(#13021F);
  
  //ground
  stroke(#03C6FF);
  strokeWeight(3);
  fill(0);
  rect(0, 300, 398, 138);
  
  player.display();
  player.move();
  player.groundCollision();
  
  obstacle.display();
  obstacle.move();
}

void keyPressed(){
 player.keyPressed(); 
}

void keyReleased(){
player.keyReleased();
}
