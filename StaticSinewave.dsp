/*
	Simple Sinewave
	Corey Ford 
	4 June 2018

	A single 440 sine wave oscillator! 
*/

import("oscillators.lib");

gate = * ( checkbox("[0]Active?") : si.smoo );

//================================================================

process = osc(440) <: _,_;