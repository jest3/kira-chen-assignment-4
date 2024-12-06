//Kira Chen
//assignment 4

PVector playerSize = new PVector (30, 40);

Player player;

void setup(){
 size (400, 400); 

player = new Player();

}

void draw(){
  //background
  background(#13021F);
  
  //ground
  stroke(#03C6FF);
  strokeWeight(3);
  fill(0);
  rect(0, 260, 398, 138);
  
  player.display();
  player.move();
}

void keyPressed(){
 player.keyPressed(); 
}

void keyReleased(){
player.keyReleased();
}
