
// OSC init
public void oscInit() {
  osc = new OscP5(this, 12000);
  supercollider = new NetAddress("127.0.0.1", 57120);
}

//Send to Supercollider
public void sendOSCMessagge(String addressPattern, int value) {

  OscMessage msg = new OscMessage(addressPattern);
  msg.add(value);
  osc.send(msg, supercollider);
}

//Listen Supercollider
void oscEvent(OscMessage theOscMessage) {

  // Print the address pattern, typetag and the first argument of the received OscMessage 
  println("### received an osc message.");
  println(" addrpattern: " + theOscMessage.addrPattern());
  println(" typetag: " + theOscMessage.typetag());
  println(" arg: " + theOscMessage.get(0).intValue());

  // Not ON/ Note OFF
  switch(theOscMessage.addrPattern()) {
    case("/noteOn"):
    noteOn(theOscMessage.get(0).intValue());
    break;
    case("/noteOff"):
    noteOff(theOscMessage.get(0).intValue());
    break;
  default:
    break;
  }
}
