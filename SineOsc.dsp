/*
	SineOsc
	Corey Ford 
	26 June 2018

	A single controllable sine wave oscillator! 
*/

import("all.lib");

freq = hslider("Frequency", 440, 20, 10000, 0.001) : si.smoo;

//================================================================

process = osc(freq) * 0.5 <: _,_ ;