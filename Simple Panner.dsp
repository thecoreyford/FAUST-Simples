/*
	Simple Panner
	Corey Ford 
	27 April 2018
*/

import("stdfaust.lib");

gate = button("[2]gate") : si.smoo;
panner = hslider("[0]panner", 0.5, 0.0, 1.0, 0.001) : si.smoo;
masterGain = hslider("[1]masterGain", 0.5, 0.0, 1.0, 0.001) : si.smoo;


leftMix = no.noise * (1.0 - panner) * gate;
rightMix = no.noise * panner * gate;

process = leftMix * masterGain , rightMix * masterGain;