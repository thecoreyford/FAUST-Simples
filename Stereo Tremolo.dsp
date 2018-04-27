/*
	Ring Modulation
	Corey Ford 
	27 April 2018

	Loosley based off: Faust Semantic Basics and Simple Audio Effects: Panner and Tremolo
	Link: https://ccrma.stanford.edu/~rmichon/faustWorkshops/course2015/#installFaustMac
*/

import("stdfaust.lib");
import("signals.lib");
import("oscillators.lib");

gain = hslider( "[0]gain", 0.1, 0.0, 1.0, 0.01 ) : si.smoo;

tremolo = 1-depth * oscillation
with{
	freq = hslider( "[1]freq", 1, 0.1, 20, 0.01 ) : si.smoo ;
	depth = hslider( "[2]depth", 0, 0, 1, 0.01 ) : si.smoo ; 
	oscillation = osc(freq) * 0.5 + 0.5; //scale and offset values
};

//============================================================

process = no.noise : tremolo <: _,_;  