
//button class for menus
class Button {

  final int WIDTH = 250;
  final int HEIGHT = 80;
  final int TEXT_SIZE = 28;
  PFont butText = createFont("SherwoodRegular.ttf", 52);

  String text;
  int posX, posY;
  color mainColor, hoverColor;
  boolean active = false;

  Sound hover;

  Button(String text, int posX, int posY, color mainColor, color hoverColor) {
    this.mainColor = mainColor;
    this.hoverColor = hoverColor;
    this.posX = posX;
    this.posY = posY;
    this.text = text;
    active = false;
    hover = new Sound(FinalProject.this, "sound/hover.wav");
  }

  void draw() {
    stroke(
      #317111);
    strokeWeight(3);
    textSize(TEXT_SIZE);
    textAlign(CENTER);
    textFont(butText);
    if (mouseOn() || active) {
      fill(hoverColor);
    } else {
      fill(mainColor);
    }
    rect(posX, posY, WIDTH, HEIGHT, 7, 7, 7, 7);
    fill(255);
    text(text, posX + (WIDTH / 2), posY + (HEIGHT / 2) + 15);
  }

  boolean mouseOn() {
    if (mouseX > posX && mouseX < posX + WIDTH && mouseY > posY && mouseY < posY + HEIGHT) {
      if (!hover.isPlaying)
        hover.play();
      return true;
    } else {
      hover.isPlaying = false;
      return false;
    }
  }
}