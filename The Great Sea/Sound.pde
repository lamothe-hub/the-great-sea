import processing.sound.*;

class Sound {

  SoundFile theSound;
  boolean isPlaying = false;

  Sound(PApplet p, String loc) {
    theSound = new SoundFile(p, loc);
  }
  void loop() {
    if (soundOn && !isPlaying) {
      theSound.loop();
      isPlaying = true;
    } else if(!soundOn){
      theSound.stop();
    }
  }

  void play() {
    if (soundOn) {
      theSound.play();
      isPlaying = true;
    }
  }

  void stop() {
    if (isPlaying) {
      theSound.stop();
      isPlaying = false;
    }
  }
}