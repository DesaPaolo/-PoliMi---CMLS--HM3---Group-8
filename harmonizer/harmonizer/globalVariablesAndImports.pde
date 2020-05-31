//GUI
import controlP5.*;
ControlP5 cp5;

ListBox l8;
ListBox l3;
ListBox l5;
ListBox l7;
Toggle t_bypass;
Toggle t_noob;
Toggle t_delay;
Toggle t_reverb;
Knob volume;
Textarea title;
Textarea title2;
Textarea title3;
Textarea t;
Textarea t_bypass2;
Textarea t_bypass3;
Textarea t_noob2;
Textarea t_delay2;
Textarea t_delay3;
Textarea t_delay4;
Textarea t_reverb2;
Textarea t_reverb3;
Textarea t_reverb4;
Textarea t_volume2;
Textarea ollare;
Textarea ollare2;
Textarea ollare3;

//flag
int bypassValue;
int noobValue;
int delayValue;
int reverbValue;
//lists value
int octaveValue;
int thirdValue;
int fifthValue;
int seventhValue;
//knob value
int volumeValue;


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

//Keyboard
ArrayList<Key> keys;
int[] blackRect = {0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1, 1, 0};
int[] whiteKeysMidiNote = {
  36, 38, 40, 41, 43, 45, 47, 
  48, 50, 52, 53, 55, 57, 59, 
  60, 62, 64, 65, 67, 69, 71, 
  72, 74, 76, 77, 79, 81, 83, 84};
int[] blackKeysMidiNote = {
  37, 39, 42, 44, 46, 
  49, 51, 54, 56, 58, 
  61, 63, 66, 68, 70, 
  73, 75, 78, 80, 82};
