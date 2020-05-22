/*
 Spooky Scary Skeleton Boss
 By Sebastian Scaini
 
 How to play:
 Move with the mouse and dodge the spooky scary skeleton's bullets.
 Click to shoot your bullets at him. You have to hit his head or he won't take damage!
 But be careful, if his bullets hit you you'll take damage.
 May the best player/skeleton win!
*/

// Make various variables to create player, skeleton, hyperdrive and control the flow of the game.
int numberOfEffects = 400;
int timeCheck;
ship playerShip;
hyperdriveEffect[] hyperdrive;
boss skeleton;
healthBar bossHealth;
healthBar playerHealth;
String status;

void setup() {
  surface.setIcon(loadImage("Icon.png"));
  surface.setTitle("Spooky Scary Skeleton Boss");
  
  ellipseMode(RADIUS);

  size(400, 600);
  
  //create all the in-game elements.
  playerShip = new ship();
  hyperdrive = new hyperdriveEffect[numberOfEffects];
  skeleton = new boss(160, 0, 600);
  bossHealth = new healthBar(0, 0, skeleton.health, 10, #FF0000);
  playerHealth = new healthBar(0, 590, 10, playerShip.health, #08E813);

  //start the timeCheck
  timeCheck = millis();

  //create the hyperdrive effect
  for (int i = 0; i < hyperdrive.length; i++) {
    hyperdrive[i] = new hyperdriveEffect(random(0, 400), -10, 0, random(5, 20));
  }
}

void draw() {
  background(#0E1538);

  //control and display the hyperdrive effect
  for (int i = 0; i < hyperdrive.length; i++) {
    hyperdrive[i].make();
    hyperdrive[i].move();
  }
  //control and display the player's bullets
  playerShip.moveBullets();
  


  //control and display the player's ship
  playerShip.move();
  //update player's health bar
  playerHealth.barWidth = playerShip.health;
  //update skeleton's health bar
  bossHealth.barHeight = skeleton.health;
  
  playerShip.display();

  //display the skeleton's health bar

  bossHealth.display();

  //display the player's health bar

  playerHealth.display();
  //display the skeleton boss
  skeleton.display();

  // shoot when the mouse is pressed and delay it to shoot every few milliseconds.
  if (mousePressed) {
    if (millis() >= timeCheck + 100) {
      playerShip.shoot();

      timeCheck = millis();
    }
  }
  
  //check the status of the game (win/lose)
  checkGameStatus();
}

//inspired by the circle_overlap adventures in code excersize and http://www.openprocessing.org/sketch/8005
//Check collisions of the player's bullets with the skeleton's head
boolean checkPBCollision() {
  if (dist(playerShip.bullet.position.x, playerShip.bullet.position.y, skeleton.bossCollision.position.x, skeleton.bossCollision.position.y) < playerShip.bullet.bulletRadius + skeleton.bossCollision.collisionWidth) {
    playerShip.bullet.moved = true;
    return true;
  } else {
    return false;
  }
}

// check the collisions of the skeleton's left hand's bullets and the player's ship
String checkLeftEBCollision() {
  if (dist(skeleton.leftHand.bullet1.position.x, skeleton.leftHand.bullet1.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.leftHand.bullet1.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.leftHand.bullet1.removeBullet = true;
    return "L1";
  }
  if (dist(skeleton.leftHand.bullet2.position.x, skeleton.leftHand.bullet2.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.leftHand.bullet2.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.leftHand.bullet2.removeBullet = true;
    return "L2";
  }
  if (dist(skeleton.leftHand.bullet3.position.x, skeleton.leftHand.bullet3.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.leftHand.bullet3.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.leftHand.bullet3.removeBullet = true;
    return "L3";
  }
  if (dist(skeleton.leftHand.bullet4.position.x, skeleton.leftHand.bullet4.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.leftHand.bullet4.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.leftHand.bullet4.removeBullet = true;
    return "L4";
  } else {
    return null;
  }
}

// check the collisions of the skeleton's right hand's bullets and the player's ship
String checkRightEBCollision() {
  if (dist(skeleton.rightHand.bullet1.position.x, skeleton.rightHand.bullet1.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.rightHand.bullet1.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.rightHand.bullet1.removeBullet = true;
    return "R1";
  }
  if (dist(skeleton.rightHand.bullet2.position.x, skeleton.rightHand.bullet2.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.rightHand.bullet2.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.rightHand.bullet2.removeBullet = true;
    return "R2";
  }
  if (dist(skeleton.rightHand.bullet3.position.x, skeleton.rightHand.bullet3.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.rightHand.bullet3.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.rightHand.bullet3.removeBullet = true;
    return "R3";
  }
  if (dist(skeleton.rightHand.bullet4.position.x, skeleton.rightHand.bullet4.position.y, playerShip.shipCollision.position.x, playerShip.shipCollision.position.y) < skeleton.rightHand.bullet4.bulletRadius + playerShip.shipCollision.collisionWidth) {
    skeleton.rightHand.bullet4.removeBullet = true;
    return "R4";
  } else {
    return null;
  }
}

//check the game's status. Trigger game over if win/lose conditions are met.
void checkGameStatus() {
  if (skeleton.health <= 0) {
    status = "win";
    gameOver();
  }
  if (playerShip.health <= 0) {
    status = "lose";
    gameOver();
  }
}

//end the game by filling the screen with black and showing win/lose text.
void gameOver() {
  fill(0);
  rect(0, 0, 400, 600);
  fill(255);
  if (status == "win") {
    textSize(50);
    text("You win!", 100, 300);
  } else if (status == "lose") {
    textSize(50);
    text("You lose!", 100, 300);
  }
}
