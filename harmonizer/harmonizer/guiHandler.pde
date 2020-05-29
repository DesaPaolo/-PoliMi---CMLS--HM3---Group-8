
//GUI init
public void guiInit() {
  
  cp5 = new ControlP5(this);

  volumeValue = 50;
  toggleValue = 0;
  
  PFont pfont = createFont("Courier new",10,true); // use true/false for smooth/no-smooth
  ControlFont font = new ControlFont(pfont,14);
  
  ControlP5.printPublicMethodsFor(ListBox.class);
  
  //ON/OFF toggle
 t_bypass= cp5.addToggle("bypass")
     .setPosition(80,100)
     .setSize(50,20)
     .setMode(ControlP5.SWITCH)
     .setFont(font);
     
     cp5.getController("bypass")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;
     
 t_noob= cp5.addToggle("noob")
     .setPosition(70,300)
     .setSize(50,20)  
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setFont(font);
     
     cp5.getController("noob")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;
     
t_delay= cp5.addToggle("delay")
     .setPosition(710,100)
     .setSize(50,20)  
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setFont(font);
     
     cp5.getController("delay")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;
     
t_reverb= cp5.addToggle("reverb")
     .setPosition(1030,100)
     .setSize(50,20)  
     .setValue(true)
     .setMode(ControlP5.SWITCH)
     .setFont(font);
     
     cp5.getController("reverb")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;
     
  //list ottava
  l8 = cp5.addListBox("ottava")
         .setPosition(70, 360)
         .setSize(120, 120)
         .setItemHeight(20)
         .setBarHeight(20)
         .setFont(font);
         //.setColorBackground(color(255, 128))
         //.setColorActive(color(0))
         //.setColorForeground(color(255, 100,0))
         ;
         
         cp5.getController("ottava")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;
         
  l8.addItem("sopra", 1);
  l8.addItem("sotto", 2);
  

   
   //list terza
  l3 = cp5.addListBox("terza")
         .setPosition(370, 360)
         .setSize(120, 120)
         .setItemHeight(20)
         .setBarHeight(20)
         .setFont(font)
         //.setColorBackground(color(255, 128))
         //.setColorActive(color(0))
         //.setColorForeground(color(255, 100,0))
         ;
         
  cp5.getController("terza")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;
   l3.addItem("maj", 1);
   l3.addItem("min", 2);
   
    //list quinta
   l5 = cp5.addListBox("quinta")
         .setPosition(710, 360)
         .setSize(120, 120)
         .setItemHeight(20)
         .setBarHeight(20)
         .setFont(font)
         //.setColorBackground(color(255, 128))
         //.setColorActive(color(0))
         //.setColorForeground(color(255, 100,0))
         ;
         
    cp5.getController("quinta")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;      
   l5.addItem("aumentata", 1);
   l5.addItem("giusta", 2);
   l5.addItem("diminuita", 3);
   
   
   //list settima
   l7 = cp5.addListBox("settima")
         .setPosition(1030, 360)
         .setSize(120, 120)
         .setItemHeight(20)
         .setBarHeight(20)
         .setFont(font)
         //.setColorBackground(color(255, 128))
         //.setColorActive(color(0))
         //.setColorForeground(color(255, 100,0))
         ;
         
    cp5.getController("settima")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ;      
   l7.addItem("maj", 1);
   l7.addItem("min", 2);
   
  
 
     
     
  //Volume knob
  volume = cp5.addKnob("volume")
    .setRange(0, 100)
    .setValue(50)
    .setPosition(370, 70)
    .setRadius(50)
    .setDragDirection(Knob.VERTICAL)
    .setFont(font);
    
      cp5.getController("volume")
     .getCaptionLabel()
     .setFont(font)
     .toUpperCase(false)
     .setSize(15)
     ; 
}

//Toggle event
void toggleOnOff(boolean flag) {
  if(flag) {
    toggleValue = 1;
  } else {
    toggleValue = 0;
  }
  sendOSCMessagge("/toggleOnOff", toggleValue);
  println("a toggle event.");
}

//Volume knob event
void volumeKnob(int value){
  volumeValue = value;
  sendOSCMessagge("/volumeValue", volumeValue);
  //bgColor = map(value, 0, 100, 0, 255);
  println("a knob event " + value);
}

//Testing-not relevant
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
