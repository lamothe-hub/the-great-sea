//menu class, implements buttons

class Menu {

  static final int MENU_BUTTONS = 5;
  Button[] menu = new Button[MENU_BUTTONS];
  Sound click, start;

  //construct a menu with the necessary buttons
  Menu() {
    menu[0] = new Button("Start", width / 2 - 125, 200, color(#79DE48), color(#BEEDA8));
    menu[1] = new Button("Exit", width / 2 - 125, 300, color(#79DE48), color(#BEEDA8));
    menu[2] = new Button("Easy", width / 2 - 275, 500, color(#79DE48), color(#BEEDA8));
    menu[3] = new Button("Hard", width / 2 + 25, 500, color(#79DE48), color(#BEEDA8));
    menu[4] = new Button("Sound", width / 2 - 125, 600, color(#79DE48), color(#BEEDA8));
    //title = loadImage("titlescreeng1.jpg");
    click = new Sound(FinalProject.this, "sound/click.wav");
    start = new Sound(FinalProject.this, "sound/start.wav");
  }

  //draw the menu items
  void displayMenu() {
    //image(title,0,0);
    fill(255, 0, 0);
    text("The Great Sea", width / 2, 100);
    menu[2].active = !isHard;
    menu[3].active = isHard;
    menu[4].active = soundOn;
    if (!menu[4].active)
      menu[4].mainColor = (100);
    else
      menu[4].mainColor = (#BEEDA8);
    for (Button b : menu) {
      b.draw();
    }
  }

  //check if buttons are pressed and act accordingly
  void checkPressed() {
    if (menu[0].mouseOn()) {
      menuActive = false;
      instructions = true;
      start.play();
    } else if (menu[1].mouseOn()) {
      exit();
    } else if (menu[2].mouseOn()) {
      isHard = false;
    } else if (menu[3].mouseOn()) {
      isHard = true;
      player.setHard();
    } else if (menu[4].mouseOn()) {
      if (soundOn)
        soundOn = false;
      else 
      soundOn = true;
    }
    click.play();
  }
}