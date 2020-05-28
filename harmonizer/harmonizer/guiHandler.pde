

public void guiInit() {
  
  cp5 = new ControlP5(this);

  volumeValue = 50;
  toggleValue = 0;
  
  
  //ON OFF toggle
  cp5.addToggle("toggleOnOff")
     .setPosition(40,100)
     .setSize(50,20);
     
     
  //Volume knob
  volume = cp5.addKnob("volumeKnob")
    .setRange(0, 100)
    .setValue(50)
    .setPosition(100, 70)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL);
}


void toggleOnOff(boolean flag) {
  if(flag) {
    toggleValue = 1;
  } else {
    toggleValue = 0;
  }
  sendOSCMessagge("/toggleOnOff", toggleValue);
  println("a toggle event.");
}


void volumeKnob(int value){
  volumeValue = value;
  sendOSCMessagge("/volumeValue", volumeValue);
  bgColor = map(value, 0, 100, 0, 255);
  println("a knob event " + value);
}


void keyPressed() {
  switch(key) {
    case('1'):
      volume.setValue(100);
      break;
    case('2'):
      volume.shuffle();
      break;
  }
}
