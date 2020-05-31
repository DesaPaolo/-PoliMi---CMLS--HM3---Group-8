

void setup() {
  
  size(1240, 450);

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
