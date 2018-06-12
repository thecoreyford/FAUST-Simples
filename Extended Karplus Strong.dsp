/*
	Extended Karplus Strong
	Corey Ford 
	12 June 2018

	Based off of ideas from: 
	- Basic Karplus Strong (part of this git repository) &
	- "Audio processes: musical analysis, modification, synthesis, and control" by David Creasey, Chapter 21.
*/

import("all.lib");

frequency = hslider("Frequency", 440, 80, 1200, 1.0);
absorbtion = hslider("Absorbstion", 1.0, 0.0, 1.0, 0.001);
fc = hslider("Cutoff", 20, 20, 2000, 1.0);
pluckPos = hslider("Pluck Position", 5, 0, 10, 0.001);

gate = button("gate");
excitation = noise * gate; //gate <: _,_' : - : >(0);

delayTime = (1 / frequency) * SR; 
tp = pluckPos * SR * 0.001; //to sample rate -> to milliseconds

feedForward = _ <: _ + (fdelay(65536, tp) *(-1)) :> _;
resonator = +~( fdelay(65536, delayTime) : lowpass(2,fc) : *(absorbtion) );

process = excitation : feedForward : resonator <: _,_; 








