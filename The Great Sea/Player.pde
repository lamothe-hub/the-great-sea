 //<>// //<>// //<>//
class Player extends Entity {

  float Xacc, Yacc;
  float cannonAngle, wheelAngle;
  final float BASEHEIGHT = height - 200;

  PImage ship, wheel, cannon;

  int health;
  boolean isDead = false;

  Projectile[] cannons = new Projectile[3];

  Sound fire, lose, jump;

  Player() {
    ship = loadImage("ship.png");
    wheel = loadImage("wheel.png");
    cannon = loadImage("cannon.png");
    for (int i = 0; i < cannons.length; i++) {
      cannons[i] = new Projectile();
    }
    x = 50;
    y = BASEHEIGHT;
    health = 5;
    oWidth = ship.width;
    oHeight = ship.height;
    fire = new Sound(FinalProject.this, "sound/cannon.wav");
    lose = new Sound(FinalProject.this, "sound/lose.mp3");
    jump = new Sound(FinalProject.this, "sound/splash.wav");
  }

  void setHard() {
    health = 3;
  }

  void calcShip() {
    x += Xacc;
    y += Yacc;
    findAngle();
    wheelAngle += 1;
    if (wheelAngle > 360) {
      wheelAngle -= 360;
    }
    if (y < BASEHEIGHT) {
      Yacc += 0.15;
    }
    if (y > BASEHEIGHT) {
      Yacc = 0;
      y = BASEHEIGHT;
    }
    if (health < 1) {
      isDead = true;
    }
  }

  void draw() {
    for (Projectile p : cannons) {
      p.draw();
    }

    calcShip();
    pushMatrix();
    translate(x, y);
    image(ship, 0, 0);
    pushMatrix();
    translate(45, 110);
    imageMode(CENTER);
    rotate(radians(wheelAngle));
    image(wheel, 0, 0);
    popMatrix();
    translate(91, 20);
    imageMode(CORNER);
    rotate(-cannonAngle);
    image(cannon, 0, -cannon.height / 2);
    popMatrix();
  }

  void findAngle() {
    float Xcomp = mouseX - ((x) + 91);
    float Ycomp = ((y) + 20) - mouseY;

    cannonAngle = atan2(Ycomp, Xcomp);
    if (cannonAngle < 0) {
      cannonAngle += 2 * PI; // [0, 2PI)
    }
    if (cannonAngle > PI) {
      if (cannonAngle > 3 * PI / 2) {
        cannonAngle = 0;
      } else {
        cannonAngle = PI;
      }
    }

    //println( Xcomp + " " + Ycomp + " " + cannonAngle);
  }

  void checkKey(char key) {
    if (key == 'd') {
      Xacc = 3;
    } else if (key == 'a') {
      Xacc = -3;
    } else if (key == ' ' && y == BASEHEIGHT) {
      Yacc = -8;
      jump.play();
    } else if (key == 'k') {
      isDead = true;
    } else if (key == '\\') {
      if (!debug)
        debug = true;
      else
        debug = false;
    }
  }

  void checkRelease(char key) {
    if (key == 'd' || key == 'a') {
      Xacc = 0;
    }/*
         println("ship");
     println("pos: " + x + "," + y);
     println("width/height: " + oWidth + "," + oHeight);*/
  }

  void fireCannon() {
    for (Projectile p : cannons) {
      if (!p.active) {
        p.fire(cannonAngle);
        fire.play();
        break;
      }
    }
  }

  void hit() {
    health--;
    if (health == 0) {
      isDead = true;
      lose.play();
    }
  }
}