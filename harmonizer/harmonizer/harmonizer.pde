

void setup() {

  oscInit();
  guiInit();
  midiInit();
  keyboardInit();

  size(1280, 750);

  bgColor = 0;
}

void draw() {

  background(bgColor);
  keyboardUpdate();
}
