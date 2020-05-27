// (use headphones!)

(
	SynthDef("pitchFollow1", { |out|
		var in, amp, freq, hasFreq, sound;
		in = Mix.new(SoundIn.ar([0, 1]));
		amp = Amplitude.kr(in, 0.05, 0.05);
		# freq, hasFreq = Pitch.kr(in, ampThreshold: 0.02, median: 7);
		//freq = Lag.kr(freq.cpsmidi.round(1).midicps, 0.05);
		sound = Mix.new(VarSaw.ar(freq * [0.5, 1, 2], 0, LFNoise1.kr(0.3, 0.1, 0.1), amp));
		6.do {
			sound = AllpassN.ar(sound, 0.040, [0.040.rand,0.040.rand], 2)
		};
		Out.ar(out, sound);
	}).play
)

(
SynthDef("pitchFollow2", { |out|
	var in, amp, freq, hasFreq, sound;
	in = Mix.new(SoundIn.ar([0, 1]));
	amp = Amplitude.kr(in, 0.05, 0.05);
	# freq, hasFreq = Pitch.kr(in, ampThreshold: 0.02, median: 7);
	sound = CombC.ar(LPF.ar(in, 1000), 0.1, (2 * freq + 10).reciprocal, -6).distort * 0.05;
	6.do({
		sound = AllpassN.ar(sound, 0.040, [0.040.rand, 0.040.rand], 2)
	});
	Out.ar(out, sound);
}).play(s);
)


(
SynthDef(\RmOctaver, { |out|
	var in, freq, hasFreq;
	in = SoundIn.ar(0);
	# freq, hasFreq = Pitch.kr(in);
	Out.ar(out, SinOsc.ar(freq: freq * 0.5) * in + in);
}).play
)

