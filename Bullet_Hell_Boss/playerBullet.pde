class playerBullet {

  PVector position = new PVector(), velocity = new PVector();
  float bulletRadius;
  color bulletColour;
  boolean moved = false, hit = false;
  
  playerBullet(float tempPositionX, float tempPositionY, float tempRadius, float tempVelocityX, float tempVelocityY, color tempColour) {
    this.position.x = tempPositionX;
    this.position.y = tempPositionY;
    this.bulletRadius = tempRadius;
    this.velocity.x = tempVelocityX;
    this.velocity.y = tempVelocityY;
    this.bulletColour = tempColour;
  }

  void display() {
    //draw bullet
    if (!moved){
      fill(bulletColour);
      ellipse(position.x, position.y, bulletRadius, bulletRadius);
    }
  }

  void move() {
  //move bullet. remove if it goes offscreen
    if(!moved){
      position.sub(velocity);
  
      if (position.y < -20) { 
          moved = true;
      }
    }
  }
}