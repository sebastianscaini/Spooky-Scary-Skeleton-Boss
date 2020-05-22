class collision{
  
  //make variables
  PVector position = new PVector();
  float collisionWidth, collisionHeight;
  
  //set variables
  collision(float tempX, float tempY, float tempWidth, float tempHeight){
    this.position.x = tempX;
    this.position.y = tempY;
    this.collisionWidth = tempWidth;
    this.collisionHeight = tempHeight;
  }
  
  void update(){
    //draw invisible collision ellipse
    noStroke();
    fill(0, 0, 0, 0);
    ellipse(position.x, position.y, collisionWidth, collisionHeight);
  }
}