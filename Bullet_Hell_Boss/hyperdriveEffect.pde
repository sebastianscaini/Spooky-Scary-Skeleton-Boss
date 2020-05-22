class hyperdriveEffect {
  
  PVector position = new PVector(), velocity = new PVector();
  
  hyperdriveEffect(float tempPosX, float tempPosY, float tempVelX, float tempVelY){
    
    this.position.x = tempPosX;
    this.position.y = tempPosY;
    this.velocity.x = tempVelX;
    this.velocity.y = tempVelY;
  }
  
  void make(){
    //draw the effect
    noStroke();
    fill(255, 255, 255, 150);
    rect(position.x, position.y, random(1, 2), 10);
  }
  
  void move(){
    //move it
    position.add(velocity);
    
    //if the y position is offscreen, reset the y position at a new x position and a new random velocity
    if(position.y > 610){
      position.y = -10;
      position.x = random(0, 400);
      velocity.y = random(5, 20);
    }
  }
}