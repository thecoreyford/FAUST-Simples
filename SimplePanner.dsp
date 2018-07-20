/*
	Simple Panner
	Corey Ford 
	27 April 2018
*/

import("stdfaust.lib");

//gate = button("gate") : si.smoo;
panner = hslider("panner", 0.5, 0.0, 1.0, 0.001) : si.smoo;
masterGain = hslider("masterGain", 0.5, 0.0, 1.0, 0.001) : si.smoo;

leftMix = _*(1.0 - panner); // * gate ;
rightMix = _*(panner); // * gate;

process = _ <: leftMix , rightMix; 