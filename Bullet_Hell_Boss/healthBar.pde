class healthBar {
  
  float x, y, barHeight, barWidth;
  color barColor;
  
  healthBar(float tempX, float tempY, float tempHeight, float tempWidth, color tempColor){
    this.x = tempX;
    this.y = tempY;
    this.barHeight = tempHeight;
    this.barWidth  = tempWidth;
    this.barColor = tempColor;
  }
  
  void display(){
    //draw the health bar
    stroke(0);
    fill(barColor);
    rect(x, y, barWidth, barHeight);
  }
}