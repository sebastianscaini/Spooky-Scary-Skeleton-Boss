class boss {

  // variables
  PVector position = new PVector(), velocity = new PVector();
  float health;
  bossHand leftHand = new bossHand(100, 70, 1, 0, 40, 140, "left"), rightHand = new bossHand(300, 70, 1, 0, 260, 360, "right");
  collision bossCollision;

  //set variables for this object
  boss(float tempPosX, float tempPosY, float tempHealth) {
    this.position.x = tempPosX;
    this.position.y = tempPosY;
    this.health = tempHealth;
    bossCollision = new collision(position.x + 40, position.y + 30, 40, 40);
  }

  void display() {
    //draw the head
    drawHead();

    //draw and update the left arm and hand
    leftHand.move();
    leftHand.display();
    drawLeftArm();

    //draw and update the right arm and hand
    rightHand.move();
    rightHand.display();
    drawRightArm();

    //update collision ellipse on the boss head.
    bossCollision.update();
  }

  //draw the head
  void drawHead() {
    stroke(0);
    fill(255);
    rect(position.x, position.y, 80, 60);
    rect(position.x + 20, position.y + 60, 40, 20);

    strokeWeight(3);
    line(position.x + 30, position.y + 15, position.x + 30, position.y + 35);
    line(position.x + 50, position.y + 15, position.x + 50, position.y + 35);

    line(position.x + 30, position.y + 65, position.x + 30, position.y + 75);
    line(position.x + 40, position.y + 65, position.x + 40, position.y + 75);
    line(position.x + 50, position.y + 65, position.x + 50, position.y + 75);
    strokeWeight(1);
  }
  
  //draw the left arm
  void drawLeftArm() {
    stroke(0);
    fill(255);
    quad(160, 0, 160, 20, leftHand.position.x + 20, leftHand.position.y + 15, leftHand.position.x, leftHand.position.y);
  }

  //draw the right arm  
  void drawRightArm() {
    stroke(0);
    fill(255);
    quad(240, 0, 240, 20, rightHand.position.x - 20, rightHand.position.y + 15, rightHand.position.x, rightHand.position.y);
  }
  
  //take damage
  void takeDamage() {
    health -= 0.3;
  }
}