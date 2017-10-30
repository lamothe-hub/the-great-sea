
/*
 This class defines the enemy objects in the game
 */
class Enemy extends Entity {


  float speed;
  Projectile bomb;
  boolean dropped = false;
  PImage enemy;
  boolean isHit = false;

  Enemy() {
    speed = 0;
    dropped = false;
    x = 1500;
    y= 1500;
    enemy = loadImage("enemy.png");
    bomb = new Projectile(1, #9B2121);
    oWidth = enemy.width;
    oHeight = enemy.height;
  }
  Enemy(int x, int y, int speed) {
    enemy = loadImage("enemy.png");
    this.x = x;
    this.y = y;
    this.speed = speed;
    bomb = new Projectile(1, #9B2121);
    oWidth = enemy.width;
    oHeight = enemy.height;
  }

  void calc() {
    x -= speed;
    y += sin(x / 100) / 2;
    bomb.x = x + 105;
    if (!dropped) {
      bomb.y = y + 105;
    }
    if (x - 50 < player.x) {
      drop();
    }
  }

  void draw() {
    calc();
    image(enemy, x, y);
    bomb.draw();
  }

  void drop() {
    dropped = true;
    bomb.active = true;
  }



  void hit() {
    isHit = true;
    if (!dropped)
      bomb.hit();
  }
}