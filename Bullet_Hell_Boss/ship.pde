class ship {

  ArrayList <playerBullet> bulletArrayList;
  PVector position = new PVector();
  float health = 400;
  playerBullet bullet, bullet2;
  collision shipCollision;

  ship() {
    bulletArrayList = new ArrayList();
    shipCollision = new collision(position.x, position.y, 20, 20);
  }

  void display() {
  //draw ship
    stroke(0);
    fill(#FF6300);
    rect(position.x - 5, position.y, 10, 20);

    fill(255);
    triangle(position.x - 7.5, position.y, position.x, position.y - 10, position.x + 7.5, position.y);

    rect(position.x - 12.5, position.y + 12, 3, -10);
    rect(position.x + 10, position.y + 12, 3, -10);

    fill(#FFEA02);
    triangle(position.x - 5, position.y + 5, position.x - 20, position.y + 20, position.x - 5, position.y + 20);
    triangle(position.x + 5, position.y + 5, position.x + 20, position.y + 20, position.x + 5, position.y + 20);
    
    //update collisions to follow ship
    shipCollision.update();
  }

  void move() {
    //move ship relative to mouse location
    if (mouseY > 100) {
      position.x = mouseX;
      position.y = mouseY;
      shipCollision.position.x = mouseX + 1;
      shipCollision.position.y = mouseY + 10;
    }
    // prevent the ship from going higher than 100
    else {
      position.x = mouseX;
      shipCollision.position.x = mouseX + 1;
    }
  }

  void shoot() {
    
    //make and shoot bullets
    bullet = new playerBullet(position.x - 12.5, position.y, 3, 0, 10, #FFEA02);
    bullet2 = new playerBullet(position.x + 12.5, position.y, 3, 0, 10, #FFEA02);

    bulletArrayList.add(bullet);
    bulletArrayList.add(bullet2);
  }

  void moveBullets() {
    //move and display bullets
    for (playerBullet bullet : bulletArrayList) {
      bullet.move();
      bullet.display();
      // check bullet collisions if they have collided with the skeleton
      if (checkPBCollision() && !bullet.hit) {
        skeleton.takeDamage();
        bullet.hit = true;
      }
    }
  }
}