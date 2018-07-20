/*
	Basic Karplus Strong
	Corey Ford 
	12 June 2018

	Based off of ideas from: 
	- 12. Introduction to Physical Modeling found at https://ccrma.stanford.edu/~rmichon/faustWorkshops/course2015/#ks

	- "Audio processes: musical analysis, modification, synthesis, and control" by David Creasey, Chapter 21.
*/

import("all.lib");

frequency = hslider("Frequency", 440, 80, 1200, 1.0);
absorbtion = hslider("Absorbstion", 1.0, 0.0, 1.0, 0.001);
fc = hslider("Cutoff", 20, 20, 2000, 1.0);
gate = button("gate");
excitation = gate <: _,_' : - : >(0);

delayTime = (1 / frequency) * SR; 

resonator = +~( fdelay(65536, delayTime) : lowpass(2,fc) : *(absorbtion) );

process = excitation : resonator <:_,_; 








