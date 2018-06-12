/*
	Delays
	Corey Ford 
	11 June 2018

	Control the delay of the input signal in milliseconds. 
*/

import("all.lib");

maxDelay = 65536;

delLength = hslider("Delay Duration (ms)", 100, 1, 1000, 0.1) * 0.001 * SR : smoo;

process = fdelay(maxDelay, delLength); //fdelay1, fdelay2, fdelay3 --> inc computation