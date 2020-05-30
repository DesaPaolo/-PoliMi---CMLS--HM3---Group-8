// Init Server/MIDI/OSC
(
s.reboot;

Server.default.options.device_("MME : Linea (2- Komplete Audio 2)");

MIDIClient.init;
MIDIIn.connectAll;

s.options.numInputBusChannels=8;
s.options.numOutputBusChannels=8;

/*//Receiver OSC Mess
~listener = {|msg, time, replyAddr, recvPort|
	if (msg[0] != "/status.reply", {
		// Log all received messages to the console.
		("Message received on port" + recvPort +
		 "from " + replyAddr.ip +
		 ":" + replyAddr.port +
		 ":" + msg).postln;
	});
};

thisProcess.addOSCRecvFunc(~listener);

// create the NetAddr (PROCESSING) for sending OSC message
b = NetAddr.new("127.0.0.1", 12000);
*/
)


//I/O meter
s.meter;



//SynthDef
(
//Mic input
SynthDef.new(\mic,{
    arg in=0, out=0, amp=0.2;
    var sig, freq, hasfreq;
    sig = SoundIn.ar(in)*amp;
    Out.ar([out, 4], sig);
}).add;


//Harmonizer
SynthDef.new(\harmonizer, {
    arg in=0, out=0, amp=1, release, gate=1, freq2, nn;
    var sig, ratio, freq, hasfreq, z;
    var env = Env.adsr(0.02, release);
    var gen = EnvGen.kr(env, gate, doneAction: Done.freeSelf);
    sig = In.ar(in);
    sig = HPF.ar(sig, freq:100);
    # freq , hasfreq = Tartini.kr(sig);
    ratio = freq2 / freq;
    sig = PitchShift.ar(sig, pitchRatio:ratio);
    //sig = Compander.ar(in: sig, control: sig, thresh: 0.005, slopeBelow: 10, slopeAbove: 1, clampTime: 0.01, relaxTime: 0.01);
    Out.ar([[out,out+1],2] , sig*gen);
}).add;




//Bus handling
~pitchBus = Bus.audio(s,2);

~micGroup = Group.new;
~pitchGroup = Group.after(~micGroup);

~micSynth = Synth(\mic , [\in,0 , \out, ~pitchBus], ~micGroup);

)



//MIDI handling
(
~num = Array.newClear(128);

MIDIdef.noteOn(\noteon, {
    arg vel, nn, channel, src;
    [vel, nn, channel, src].postln;
	//b.sendMsg("/noteOn", nn);
    ~num[nn] = Synth(\harmonizer, [\freq2, nn.midicps, \in,~pitchBus , \out, 0], ~pitchGroup);
});


MIDIdef.noteOff(\noteoff, {
    arg vel, nn, channel, src;
    [vel, nn, channel, src].postln;
	//b.sendMsg("/noteOff", nn);
    ~num[nn].release(0.1);
});

)


//Recording (\Documents\Supercollider\Recordings)
s.record(duration: 30);