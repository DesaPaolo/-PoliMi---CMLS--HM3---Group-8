//LISTEN OSC MESSAGE
(
~listener = {|msg, time, replyAddr, recvPort|
	if (msg[0] != "/status.reply", {
		// Log all received messages to the console.
		("Message received on port" + recvPort + "from " + replyAddr.ip + ":" + replyAddr.port + ":" + msg).postln;
	});
};

thisProcess.addOSCRecvFunc(~listener);
)


b = NetAddr.new("127.0.0.1", 12000);    // create the NetAddr PROCESSING


MIDIClient.init;
MIDIIn.connectAll;



(
~num = Array.newClear(128);




SynthDef.new(\miditest,{
    arg freq, in = 0, amp, gate = 1, release = 0.1;
    var sig;
    var env = Env.adsr(0.02, release);
    var gen = EnvGen.kr(env, gate, doneAction: Done.freeSelf);  //doneAction: Done.freeSelf -> This can be used to free the enclosing synth
    sig = SoundIn.ar(in!2)*amp/100*gen;
    sig = PitchShift.ar(sig,windowSize:0.2, pitchRatio:1.5);
    Out.ar([0,1] ,sig);
}
).add;






MIDIdef.noteOn(\noteontest, {
    arg vel, nn, channel, src;
    [vel, nn, channel, src].postln;
	b.sendMsg("/noteOn", nn);
    ~num[nn] = Synth.new(\miditest, [\freq, nn.midicps, \amp, vel]);
});




MIDIdef.noteOff(\noteofftest, {
    arg vel, nn, channel, src;
    [vel, nn, channel, src].postln;
	b.sendMsg("/noteOff", nn);
    ~num[nn].release(1.5);
});
)