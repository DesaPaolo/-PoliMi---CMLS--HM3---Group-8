//GUI
import controlP5.*;
ControlP5 cp5;

Knob volume;
int volumeValue;

int toggleValue; //ON/OFF


// OSC Open Sound Control
import oscP5.*;
import netP5.*;

OscP5 osc;
NetAddress supercollider;

//MIDI
ArrayList<Note> tempNotes;
Boolean alreadyInTempChord;
int maxNumVoices;

//BG
float bgColor;
