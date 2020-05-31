// Init Server/MIDI/OSC
(
s.reboot;

Server.default.options.device_("ASIO : Komplete Audio ASIO Driver");

MIDIClient.init;
MIDIIn.connectAll;

s.options.numInputBusChannels=8;
s.options.numOutputBusChannels=8;

//Receiver OSC Mess
~listener = {|msg, time, replyAddr, recvPort|
	if(msg[0] != '/status.reply',{
		msg.postln;
	});
	switch (msg[0],
		'/bypass', {switch (msg[1],
			1, {~micSynth.set(\outclean, 0, \outpitch, 1);},
			0, {~micSynth.set(\outpitch, ~toharmoBus , \outclean, ~cleanBus);}
		)},
		'/noob', {switch (msg[1],
			1, {~noobSynth.free;},
			0, {~noobSynth = Synth( \noobHarmonizer, [\in, ~toharmoBus , \out, ~pitchedBus], ~pitchGroup);}
		)},
		'/delay', {switch (msg[1],
			0, {~delaySynth.set(\mix, -1);},
			1, {~delaySynth.set(\mix, 0);}
		)},
		'/reverb', {switch (msg[1],
			0, {~reverbSynth.set(\mix, -1);},
			1, {~reverbSynth.set(\mix, 0);}
		)},
		'/octave', {switch (msg[1],
			0, {~noobSynth.set(\ratioOctave, 2);},
			1, {~noobSynth.set(\ratioOctave, 0.5);}
		)},
		'/third', {switch (msg[1],
			0, {~noobSynth.set(\ratioThird, (5/4));},
			1, {~noobSynth.set(\ratioThird, (6/5));}
		)},
		'/fifth', {switch (msg[1],
			0, {~noobSynth.set(\ratioFifth, (8/5));},
			1, {~noobSynth.set(\ratioFifth, (3/2));},
			2, {~noobSynth.set(\ratioFifth, (45/32));}
		)},
		'/seventh', {switch (msg[1],
			0, {~noobSynth.set(\ratioSeventh, (15/8));},
			1, {~noobSynth.set(\ratioSeventh, (16/9));}
		)},
		'/volume', {~mixSynth.set(\ampPitched, msg[1]);}
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
//Mic
SynthDef(\mic,{
    arg in=0, outpitch=0, outclean=0, bypassON=0;
    var sig, freq, hasfreq;
    sig = SoundIn.ar(in);
    sig = HPF.ar(sig, freq:100);
    Out.ar([outclean], sig); // to toCleanBus -> 0 if bypass ON
	Out.ar([outpitch], sig); // to toHarmoBus -> 1 if bypass ON
}).add;

//Harmonizer
SynthDef(\harmonizer, {
    arg in=0, out=0, amp=2, release, gate=1, freq2, nn;
    var sig, ratio, freq, hasfreq;
    var env = Env.adsr(0.02, release);
    var gen = EnvGen.kr(env, gate, doneAction: Done.freeSelf);
    in = In.ar(in);
    # freq , hasfreq = Tartini.kr(in);
    ratio = freq2 / freq;
    sig = PitchShift.ar(in, pitchRatio:ratio);
    sig = Compander.ar(in: sig, control: in, thresh: 0.1, slopeBelow: 1.7, slopeAbove: 1, clampTime: 0.01, relaxTime: 0.01);
    Out.ar([out] , sig*gen*amp);
}).add;

//NoobHarmonizer
SynthDef(\noobHarmonizer, {
    arg in=0, out=0, ratioOctave=1, ratioThird = 1, ratioFifth = 1, ratioSeventh = 1;
    var octave, third, fifth, seventh, sig;
    in = In.ar(in);
    octave = PitchShift.ar(in, pitchRatio:ratioOctave);
	third = PitchShift.ar(in, pitchRatio:ratioThird);
	fifth = PitchShift.ar(in, pitchRatio:ratioFifth);
	seventh = PitchShift.ar(in, pitchRatio:ratioSeventh);
	sig = Mix([octave, third, fifth, seventh]);
    sig = Compander.ar(in: sig, control: in, thresh: 0.1, slopeBelow: 1.7, slopeAbove: 1, clampTime: 0.01, relaxTime: 0.01);
	Out.ar([out], sig);
}).add;

//Mix
SynthDef(\mix, {
    arg inclean = 0, inpitch, out=0, ampPitched=1;
    var sig1 = In.ar(inclean);
    var sig2 = In.ar(inpitch);
	var sig = Mix([sig1*0.4, sig2 * ampPitched]);
    Out.ar([out],sig);
}).add;

//Delay
SynthDef(\delay, {
	arg in=0, out=0, maxdeltime=0.2, deltime=0.5, mix=(-1), decay=2;
    var sig, delay;
    sig = In.ar(in);
    delay = CombL.ar(sig, maxdeltime, deltime, decay);
    sig = XFade2.ar(sig, delay, mix);
	Out.ar([out],sig);
}).add;

//Reverb
SynthDef(\reverb, {
	arg in=0, out=0, mix=(-1);
    var sig, reverb;
    sig = In.ar(in);
	reverb = JPverb.ar(sig, t60: 1, damp: 0.0, size: 0.1, earlyDiff: 0.707, modDepth: 0.1, modFreq: 2.0, low: 1.0, mid: 0.6, high: 1.0, lowcut: 500.0, highcut: 5000.0);
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
~micSynth = Synth(\mic , [\in,0 , \outpitch, ~toharmoBus, \outclean, ~cleanBus ], ~micGroup);
~mixSynth = Synth.head(~effectGroup, \mix, [\inclean, ~cleanBus, \inpitch, ~pitchedBus, \out, ~mixBus], ~effectGroup,);
~delaySynth = Synth.after(~mixSynth, \delay, [\in, ~mixBus , \out, ~effectBus1 ], ~effectGroup);
~reverbSynth = Synth.after(~delaySynth, \reverb, [\in, ~effectBus1 , \out, 0],~effectGroup);
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
s.record(duration: 60);