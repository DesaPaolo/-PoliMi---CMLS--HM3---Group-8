
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
                  .setPosition(449,17)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
title.setText("ollarizer." );  



title3 = cp5.addTextarea("ollarizer3.")
                  .setPosition(455,19)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(64, 186, 213))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
title3.setText("ollarizer." );
                  
 title2 = cp5.addTextarea("ollarizer2.")
                  .setPosition(452,18)
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
                  .setPosition(67,51)
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
    .setPosition(70, 30)
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
    

    t_noob2 = cp5.addTextarea("noob2")
                  .setPosition(69,145)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(64, 186, 213))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_noob2.setText("noob." ); 
    
    
    

  t_noob= cp5.addToggle("noob")
    .setCaptionLabel("noob.")
    .setValue(false)
    .setPosition(70, 120)
    .setSize(50, 20)  
    .setMode(ControlP5.SWITCH)
    .setColorBackground(color(64, 186, 213))
    .setColorActive(color(255, 255, 255))
    .setFont(font);


  cp5.getController("noob")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(20);

 t_delay2 = cp5.addTextarea("delay2")
                  .setPosition(827,141)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_delay2.setText("delay." ); 


 



  t_delay= cp5.addToggle("delay_")
    .setCaptionLabel("delay.")
    .setPosition(830, 120)
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
    
    
     t_reverb2 = cp5.addTextarea("reverb2")
                  .setPosition(939,141)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_reverb2.setText("reverb." ); 

  t_reverb= cp5.addToggle("reverb")
    .setCaptionLabel("reverb.")
    .setPosition(942, 120)
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
    .setPosition(182, 120)
    .setSize(100, 100)
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
    .setPosition(344, 120)
    .setSize(100, 100)
    .setItemHeight(20)
    .setBarHeight(20)
    .setColorBackground(color(64, 186, 213))
    .setColorActive(color(27,108,168))
    .setFont(font);
  //.setColorBackground(color(255, 128))
  //.setColorActive(color(0))
  //.setColorForeground(color(255, 100,0));

  

  cp5.getController("third")
    .getCaptionLabel()
    .setFont(font)
    .toUpperCase(false)
    .setSize(17);
    
    l3.addItem("maj.", 1);
  l3.addItem("min.", 2);


  l5 = cp5.addListBox("fifth")
    .setCaptionLabel("fifth.")
    .setPosition(506, 120)
    .setSize(100, 100)
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
    .setPosition(668, 120)
    .setSize(100, 100)
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
  
   t_volume2 = cp5.addTextarea("volume2")
                  .setPosition(1060,181)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_volume2.setText("volume." ); 
  
  volume = cp5.addKnob("volume")
    .setCaptionLabel("volume.")
    .setRange(0, 100)
    .setValue(50)
    .setPosition(1055, 80)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL)
    .setFont(font)
    .setColorForeground(color(255))
    .setColorBackground(color(255, 128, 176))
    .setColorActive(color(64, 186, 213))
    .setColorValueLabel(color(255, 128, 176));

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
    cp5.getController("delay_")
    .hide();
    t_delay2.setText("" );
    t_delay3.setText("" );
    t_delay4.setText("" );
    cp5.getController("volume")
    .hide();
    t_volume2.setText("" ); 
    cp5.getController("noob")
    .hide();
    t_noob2.setText("" ); 
    cp5.getController("reverb")
    .hide();
    t_reverb2.setText("" ); 
    t_reverb3.setText("" );
    t_reverb4.setText("" );
    cp5.getController("octave")
    .hide();
    cp5.getController("third")
    .hide();
    cp5.getController("fifth")
    .hide();
    cp5.getController("seventh")
    .hide();
    ollare = cp5.addTextarea("ollaree")
                  .setPosition(159,121)
                  .setSize(1100,100)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
ollare.setText("ollareollareollareollare" );
ollare2 = cp5.addTextarea("ollareee")
                  .setPosition(175,121)
                  .setSize(1100,100)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(64, 186, 213))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
ollare2.setText("ollareollareollareollare" );
ollare3 = cp5.addTextarea("ollareeee")
                  .setPosition(167,121)
                  .setSize(1100,100)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 255, 255))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
ollare3.setText("ollareollareollareollare" );
    
    
  } else {
    bypassValue = 0;
    cp5.getController("delay_")
    .show();
    t_delay2.setText("delay." );
    t_delay3.setText("delay." );
    t_delay4.setText("delay." );
    cp5.getController("volume")
    .show();
    t_volume2.setText("volume." ); 
    cp5.getController("noob")
    .show();
    t_noob2.setText("noob." );
    cp5.getController("reverb")
    .show();
    t_reverb2.setText("reverb." );
    t_reverb3.setText("reverb." );
    t_reverb4.setText("reverb." );
    cp5.getController("octave")
    .show();
    cp5.getController("third")
    .show();
    cp5.getController("fifth")
    .show();
    cp5.getController("seventh")
    .show();
    ollare = cp5.addTextarea("ollaree")
                  .setPosition(100,161)
                  .setSize(1100,100)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  .hide()
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
ollare.setText("ollareollareollareollare" );
   ollare2 = cp5.addTextarea("ollareee")
                  .setPosition(100,161)
                  .setSize(1100,100)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  .hide()
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
ollare2.setText("ollareollareollareollare" );
    ollare3 = cp5.addTextarea("ollareeee")
                  .setPosition(100,161)
                  .setSize(1100,100)
                  .setFont(createFont("Courier new",60))
                  .setLineHeight(14)
                  .setColor(color(255, 255, 255))
                  .hide()
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
ollare3.setText("ollareollareollareollare" );
  }
  sendOSCMessagge("/bypass", bypassValue);
  println("a toggle event: " + bypassValue);
}


void noob(boolean flag) {
  if (flag) {
    noobValue = 1;
    cp5.getController("octave")
    .hide();
    cp5.getController("third")
    .hide();
    cp5.getController("fifth")
    .hide();
    cp5.getController("seventh")
    .hide();

  } else {
    noobValue = 0;
    cp5.getController("octave")
    .show();
    cp5.getController("third")
    .show();
    cp5.getController("fifth")
    .show();
    cp5.getController("seventh")
    .show();
  
  }
  sendOSCMessagge("/noob", noobValue);
  println("a toggle event: " + noobValue);
}


void delay_(boolean flag) { // "delay" is a processing function ( -.-")
  if (flag) {
    delayValue = 1;
    t_delay3 = cp5.addTextarea("delay3")
                  .setPosition(827,161)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",18))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_delay3.setText("delay." );

t_delay4 = cp5.addTextarea("delay4")
                  .setPosition(827,177)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",16))
                  .setLineHeight(14)
                  .setColor(color(255, 255, 255))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_delay4.setText("delay." );
  
  } else {
    delayValue = 0;
    t_delay3 = cp5.addTextarea("delay3")
                  .setPosition(827,161)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",18))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  .hide()
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_delay3.setText("delay." );

t_delay4 = cp5.addTextarea("delay4")
                  .setPosition(827,177)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",16))
                  .setLineHeight(14)
                  .setColor(color(255, 255, 255))
                  .hide()
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_delay4.setText("delay." );
  }
  sendOSCMessagge("/delay", delayValue);
  println("a toggle event: " + delayValue);
}





//REVERBBBBBBBBBBBBBBBBBBB
void reverb(boolean flag) {
  if (flag) {
    reverbValue = 1;
    t_reverb3 = cp5.addTextarea("reverb3")
                  .setPosition(940,147)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_reverb3.setText("reverb." );

t_reverb4 = cp5.addTextarea("reverb4")
                  .setPosition(940,151)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 255, 255))
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_reverb4.setText("reverb." );
  } else {
    reverbValue = 0;
    t_reverb3 = cp5.addTextarea("reverb3")
                  .setPosition(940,147)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 128, 176))
                  .hide()
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_reverb3.setText("reverb." );

t_reverb4 = cp5.addTextarea("reverb4")
                  .setPosition(940,151)
                  .setSize(400,70)
                  .setFont(createFont("Courier new",20))
                  .setLineHeight(14)
                  .setColor(color(255, 255, 255))
                  .hide()
                  //.setColorBackground(color(255,100))
                  //.setColorForeground(color(255,100));
                  ;
t_reverb4.setText("reverb." );
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
