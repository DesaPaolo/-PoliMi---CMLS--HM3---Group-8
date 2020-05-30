
//GUI init
public void guiInit() {

  cp5 = new ControlP5(this);

  bypassValue = 0;
  noobValue = 0;
  delayValue = 0;
  reverbValue = 0;

  volumeValue = 50;

  PFont pfont = createFont("Courier new", 10, false); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont, 14);

title = cp5.addTextarea("ollarizer.")
                  .setPosition(499,249)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
title.setText("ollarizer." );  



title3 = cp5.addTextarea("ollarizer3.")
                  .setPosition(505,251)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(64, 186, 213))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
title3.setText("ollarizer." );
                  
 title2 = cp5.addTextarea("ollarizer2.")
                  .setPosition(502,250)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 255, 255))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
title2.setText("ollarizer." );                 
                  
                  
  //ON/OFF toggles
  
   t_bypass2 = cp5.addTextarea("bypass2")
                  .setPosition(77,122)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_bypass2.setText("bypass." );

//t_bypass3 = cp5.addTextarea("bypass3")
//                  .setPosition(79,124)
//                  .setSize(400,70)
//                  .setFont(createFont("Courier new",20))
//                  .setLineHeight(14)
//                  .setColor(color(64, 186, 213))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
//                  ;
//t_bypass3.setText("bypass." );

  t_bypass = cp5.addToggle("bypass")
    .setCaptionLabel("bypass.")
    .setValue(false)
    .setPosition(80, 100)
    .setSize(50, 20)
    .setMode(ControlP5.SWITCH)
    .setColorBackground(color(255, 255, 255))
    .setColorActive(color(255, 128, 176))
    .setFont(font);

  cp5.getController("bypass")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(20);
    
 
    
    
    
    
    
    
    

  t_noob= cp5.addToggle("noob")
    .setCaptionLabel("noob.")
    .setPosition(70, 300)
    .setSize(50, 20)  
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .setColorBackground(color(64, 186, 213))
    .setColorActive(color(255, 255, 255))
    .setFont(font);

  cp5.getController("noob")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(20);

  t_delay= cp5.addToggle("delay_")
    .setCaptionLabel("delay.")
    .setPosition(710, 100)
    .setSize(50, 20)  
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .setColorBackground(color(255, 255, 255))
    .setColorActive(color(255, 128, 176))
    .setFont(font);

  cp5.getController("delay_")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(20);

  t_reverb= cp5.addToggle("reverb")
    .setCaptionLabel("reverb.")
    .setPosition(1030, 100)
    .setSize(50, 20)  
    .setValue(false)
    .setMode(ControlP5.SWITCH)
    .setColorBackground(color(255, 255, 255))
    .setColorActive(color(255, 128, 176))
    .setFont(font);

  cp5.getController("reverb")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(20);

  //Lists
  l8 = cp5.addListBox("octave")
    .setCaptionLabel("octave.")
    .setPosition(70, 360)
    .setSize(120, 120)
    .setItemHeight(20)
    .setBarHeight(20)
    .setColorBackground(color(64, 186, 213))
    .setColorActive(color(27,108,168))
    .setFont(font);
  //.setColorBackground(color(255, 128))
  //.setColorActive(color(0))
  //.setColorForeground(color(255, 100,0));

  cp5.getController("octave")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(17);

  l8.addItem("up.", 1);
  l8.addItem("down.", 2);


  l3 = cp5.addListBox("third")
    .setCaptionLabel("third.")
    .setPosition(370, 360)
    .setSize(120, 120)
    .setItemHeight(20)
    .setBarHeight(20)
    .setColorBackground(color(64, 186, 213))
    .setColorActive(color(27,108,168))
    .setFont(font);
  //.setColorBackground(color(255, 128))
  //.setColorActive(color(0))
  //.setColorForeground(color(255, 100,0));

  l3.addItem("maj.", 1);
  l3.addItem("min.", 2);

  cp5.getController("third")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(17);


  l5 = cp5.addListBox("fifth")
    .setCaptionLabel("fifth.")
    .setPosition(710, 360)
    .setSize(120, 120)
    .setItemHeight(20)
    .setBarHeight(20)
    .setColorBackground(color(64, 186, 213))
    .setColorActive(color(27,108,168))
    .setFont(font);
  //.setColorBackground(color(255, 128))
  //.setColorActive(color(0))
  //.setColorForeground(color(255, 100,0));

  cp5.getController("fifth")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(17);

  l5.addItem("aug.", 1);
  l5.addItem("perfect.", 2);
  l5.addItem("dim.", 3);


  l7 = cp5.addListBox("seventh")
    .setCaptionLabel("seventh.")
    .setPosition(1030, 360)
    .setSize(120, 120)
    .setItemHeight(20)
    .setBarHeight(20)
    .setColorBackground(color(64, 186, 213))
    .setColorActive(color(27,108,168))
    .setFont(font);
  //.setColorBackground(color(255, 128))
  //.setColorActive(color(0))
  //.setColorForeground(color(255, 100,0));

  cp5.getController("seventh")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(17);      

  l7.addItem("maj.", 1);
  l7.addItem("min.", 2);

  //Volume knob
  volume = cp5.addKnob("volume")
    .setCaptionLabel("volume.")
    .setRange(0, 100)
    .setValue(50)
    .setPosition(370, 70)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL)
    .setFont(font)
    .setColorForeground(color(255))
    .setColorBackground(color(255, 128, 176))
    .setColorActive(color(255,255,0));

    cp5.getController("volume")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(20); 
  
}

//EVENTS

//Toggle events 
void bypass(boolean flag) {
  if (flag) {
    bypassValue = 1;
  } else {
    bypassValue = 0;
  }
  sendOSCMessagge("/bypass", bypassValue);
  println("a toggle event: " + bypassValue);
}


void noob(boolean flag) {
  if (flag) {
    noobValue = 1;
  } else {
    noobValue = 0;
  }
  sendOSCMessagge("/noob", noobValue);
  println("a toggle event: " + noobValue);
}


void delay_(boolean flag) { // "delay" is a processing function ( -.-")
  if (flag) {
    delayValue = 1;
    cp5.getController("delay_")
    .getCaptionLabel()
    .setColor(color(255,192,203))
    .toUpperCase(false)
    .setSize(15);
  
  } else {
    delayValue = 0;
    cp5.getController("delay_")
    .getCaptionLabel()
    .setColor(color(255,255,255))
    .toUpperCase(false)
    .setSize(15);
    
  }
  sendOSCMessagge("/delay", delayValue);
  println("a toggle event: " + delayValue);
}

void reverb(boolean flag) {
  if (flag) {
    reverbValue = 1;
  } else {
    reverbValue = 0;
  }
  sendOSCMessagge("/reverb", reverbValue);
  println("a toggle event: " + reverbValue);
}

//List events
void octave(int value) {
  octaveValue = value;
  sendOSCMessagge("/octave", octaveValue);
  println("a list event: " + octaveValue);
}

void third(int value) {
  thirdValue = value;
  sendOSCMessagge("/third", thirdValue);
  println("a list event: " + thirdValue);
}

void fifth(int value) {
  fifthValue = value;
  sendOSCMessagge("/fifth", fifthValue);
  println("a list event: " + fifthValue);
}

void seventh(int value) {
  seventhValue = value;
  sendOSCMessagge("/seventh", seventhValue);
  println("a list event: " + seventhValue);
}

//Volume knob event
void volume(int value) {
  volumeValue = value;
  sendOSCMessagge("/volume", volumeValue);
  println("a knob event: " + volumeValue);
}
