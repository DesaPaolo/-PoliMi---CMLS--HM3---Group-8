// Init Server/MIDI/OSC
(

s.reboot;


MIDIClient.init;
MIDIIn.connectAll;

s.options.numInputBusChannels=8;
s.options.numOutputBusChannels=8;

//Receiver OSC Mess
~listener = {|msg, time, replyAddr, recvPort|

	switch (msg[0],
		'/bypass', {},
		'/noob', {('note yet implemented').postln;},
		'/delay', {},
		'/reverb', {},
		'/octave', {('note yet implemented').postln;},
		'/third', {('note yet implemented').postln;},
		'/fifth', {('note yet implemented').postln;},
		'/seventh', {('note yet implemented').postln;},
		'/volume', {}
	)

};

thisProcess.addOSCRecvFunc(~listener);


// create the NetAddr (PROCESSING) for sending OSC message
b = NetAddr.new("127.0.0.1", 12000);

)

//I/O meter
s.meter;



//SynthDef
(
SynthDef(\mic,{
    arg in=0, out=0, outclean=0, amp=1, amp2=1;
    var sig, freq, hasfreq;
    sig = SoundIn.ar(in);
    sig = HPF.ar(sig, freq:100);
	Out.ar([out], sig * amp2); // to toHarmoBus
    Out.ar([outclean], sig * amp); //clean to toCleanBus
}).add;






//Harmonizer
SynthDef(\harmonizer, {
    arg in=0, out=0, amp=2, release, gate=1, freq2, nn;
    var sig, ratio, freq, hasfreq, z;
    var env = Env.adsr(0.02, release);
    var gen = EnvGen.kr(env, gate, doneAction: Done.freeSelf);
    in = In.ar(in);
    # freq , hasfreq = Tartini.kr(in);
    ratio = freq2 / freq;
    sig = PitchShift.ar(in, pitchRatio:ratio);
    sig = Compander.ar(in: sig, control: in, thresh: 0.1, slopeBelow: 1.7, slopeAbove: 1, clampTime: 0.01, relaxTime: 0.01);
    Out.ar([out] , sig*gen*amp);
}).add;




//MIX
SynthDef(\mix, {
    arg inclean = 0, inpitch, out=0;
    var sig1 = In.ar(inclean);
    var sig2 = In.ar(inpitch);
    var sig = Mix([sig1,sig2]);
    Out.ar([out],sig);
}).add;



//Delay
SynthDef(\delay, {
	arg in=0, out=0, maxdeltime=0.2, deltime=0.5, mix=0, decay=1.5;
    var sig, delay;
    sig = In.ar(in);
    delay = CombL.ar(sig, maxdeltime, deltime, decay);
    sig = XFade2.ar(sig, delay, mix);
	Out.ar([out,out+1],sig);
}).add;



//Reverb
SynthDef(\reverb, {
	arg in=0, out=0, mix=0;
    var sig, reverb;
    sig = In.ar(in);
	reverb = JPverb.ar(sig, t60: 2, damp: 0.0, size: 0.4, earlyDiff: 0.707, modDepth: 0.1, modFreq: 2.0, low: 1.0, mid: 0.6, high: 1.0, lowcut: 500.0, highcut: 5000.0);
    //reverb = FreeVerb.ar(sig, mix: 0.5, room: 0.7, damp: 0.5, mul: 1.0, add: 0.0);
    sig = XFade2.ar(sig, reverb, mix);
    Out.ar([out],sig);
}).add;






//Bus handling
~pitchedBus = Bus.audio(s,2);



~toharmoBus = Bus.audio(s,2);



~cleanBus = Bus.audio(s,2);



~mixBus = Bus.audio(s,2);



~effectBus1 = Bus.audio(s,2);




//Groups
~micGroup = Group.new;



~pitchGroup = Group.after(~micGroup);



~effectGroup = Group.after(~pitchGroup);





//Synths
~micSynth = Synth(\mic , [\in,0 , \out, ~toharmoBus, \outclean, ~cleanBus ], ~micGroup);



~mixSynth = Synth.head(~effectGroup, \mix, [\inclean, ~cleanBus, \inpitch, ~pitchedBus, \out, ~mixBus], ~effectGroup,);



//~delaySynth = Synth.after(~mixSynth, \delay, [\in, ~mixBus , \out, ~effectBus1 ], ~effectGroup);



~reverbSynth = Synth.after(~mixSynth, \reverb, [\in, ~mixBus , \out, 0],~effectGroup);



)





//MIDI handling
(
~num = Array.newClear(128);



MIDIdef.noteOn(\noteon, {
    arg vel, nn, channel, src;
    [vel, nn, channel, src].postln;
    b.sendMsg("/noteOn", nn);
    ~num[nn] = Synth(\harmonizer, [\freq2, nn.midicps, \in,~toharmoBus , \out,~pitchedBus ], ~pitchGroup);
});




MIDIdef.noteOff(\noteoff, {
    arg vel, nn, channel, src;
    [vel, nn, channel, src].postln;
    b.sendMsg("/noteOff", nn);
    ~num[nn].release(0.1);
});



)

//Recording (\Documents\Supercollider\Recordings)
s.record(duration: 30);