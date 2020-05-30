

void setup() {
  
  size(1280, 750);

  oscInit();
  guiInit();
  midiInit();
  keyboardInit();

  

  bgColor = 0;
}

void draw() {

  background(bgColor);
  keyboardUpdate();
}
