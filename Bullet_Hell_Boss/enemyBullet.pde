class enemyBullet{
  
  // make variables
  PVector position = new PVector(), velocity = new PVector();
  color bulletColour;
  boolean removeBullet = false, hit = false;
  float bulletRadius;
  
  //set variables
  enemyBullet(float tempPX, float tempPY, float tempVX, float tempVY, float tempRadius, color tempColour){
    this.position.x = tempPX;
    this.position.y = tempPY;
    this.velocity.x = tempVX;
    this.velocity.y = tempVY;
    this.bulletRadius = tempRadius;
    this.bulletColour = tempColour;
  }
  
  void display(){
    //if the bullet is not removed, draw bullet
    if(!removeBullet){
      stroke(0);
      fill(bulletColour);
      ellipse(position.x, position.y, bulletRadius, bulletRadius);
    }
    // if the bullet goes out of bounds, remove it
    if(position.y > 620 || position.x < 0 || position.x > 400){
      removeBullet = true;
    }
  }
  
  void update(){
    //if the bullet is not removed, move it
    if(!removeBullet){
      position.add(velocity);
    }
  }
}