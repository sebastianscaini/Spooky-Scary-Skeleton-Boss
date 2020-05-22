class bossHand {
  
  // make variables
  PVector position = new PVector(), velocity = new PVector();
  float leftBounds, rightBounds;
  int timeCheck = millis();
  boolean swap = true;
  String type;
  ArrayList<enemyBullet> bossBullets;
  enemyBullet bullet1, bullet2, bullet3, bullet4;
  
  //set variables for this object
  bossHand(float tempPosX, float tempPosY, float tempVelX, float tempVelY, float tempBoundL, float tempBoundR, String tempType){
    this.position.x = tempPosX;
    this.position.y = tempPosY;
    this.velocity.x = tempVelX;
    this.velocity.y = tempVelY;
    this.type = tempType;
    this.leftBounds = tempBoundL;
    this.rightBounds = tempBoundR;
    
    bossBullets = new ArrayList();
  }
  
  void display(){
    //draw hand
    stroke(0);
    fill(255);
    triangle(position.x, position.y, position.x + 20, position.y + 15, position.x - 20, position.y + 15);
    rect(position.x - 20, position.y + 15, 5, 10);
    rect(position.x - 7.5, position.y + 15, 5, 10);
    rect(position.x + 5, position.y + 15, 5, 10);
    rect(position.x + 15, position.y + 15, 5, 10);
    
    //shoot with a random time interval
    if (millis() >= timeCheck + random(50, 100)){
      shoot();
      
      timeCheck = millis();
    }
    //move bullets
    moveBullets();
  }
  
  //move hands
  void move(){
    //swap swaps directions based off true or false
    if (swap){
      position.add(velocity);
      
      if (position.x == rightBounds){
        swap = false;
      } 
    }
    else if (!swap){
      position.sub(velocity);

      if (position.x == leftBounds){
        swap = true;
      }
    }
  }
  
  //shoot bullets
  void shoot(){
    bullet1 = new enemyBullet(position.x - 20, position.y + 15, random(-10, 10), random(2, 8), 5, #E82C0C);
    bullet2 = new enemyBullet(position.x - 7.5, position.y + 15, random(-10, 10), random(2, 8), 5, #E82C0C);
    bullet3 = new enemyBullet(position.x + 5, position.y + 15, random(-10, 10), random(2, 8), 5, #E82C0C);
    bullet4 = new enemyBullet(position.x + 15, position.y + 15, random(-10, 10), random(2, 8), 5, #E82C0C);
    
    bossBullets.add(bullet1);
    bossBullets.add(bullet2);
    bossBullets.add(bullet3);
    bossBullets.add(bullet4);
  }
  
  //move bullets
  void moveBullets(){
    for (enemyBullet bullet1 : bossBullets){
      bullet1.update();
      bullet1.display();
        
        //check collisions for bullets from left hand with the player's ship, remove if collided
        if (type == "left"){
          if (checkLeftEBCollision() == "L1" && !bullet1.hit){
            bullet1.removeBullet = true;
            bullet1.hit = true;
            playerShip.health -= 0.5;
          }
          else if (checkLeftEBCollision() == "L2" && !bullet2.hit){
            bullet2.removeBullet = true;
            bullet2.hit = true;
            playerShip.health -= 0.5;
          }
          else if (checkLeftEBCollision() == "L3" && !bullet3.hit){
            bullet3.removeBullet = true;
            bullet3.hit = true;
            playerShip.health -= 0.5;
          }
          else if (checkLeftEBCollision() == "L4" && !bullet4.hit){
            bullet4.removeBullet = true;
            bullet4.hit = true;
            playerShip.health -= 0.5;
          }
        }
        //check collisions for bullets from right hand, remove if collided
        else if (type == "right"){
          if (checkRightEBCollision() == "R1" & !bullet1.hit){
            bullet1.removeBullet = true;
            bullet1.hit = true;
            playerShip.health -= 0.5;
          }
          else if (checkRightEBCollision() == "R2" & !bullet2.hit){
            bullet2.removeBullet = true;
            bullet2.hit = true;
            playerShip.health -= 0.5;
          }
          else if (checkRightEBCollision() == "R3" & !bullet3.hit){
            bullet3.removeBullet = true;
            bullet3.hit = true;
            playerShip.health -= 0.5;
          }
          else if (checkRightEBCollision() == "R4" & !bullet4.hit){
            bullet4.removeBullet = true;
            bullet4.hit = true;
            playerShip.health -= 0.5;
          }
        }
    }
  }
}