/*
	Basic AM Synthesis
	Corey Ford 
	27 April 2018

*/

import("stdfaust.lib");
import("signals.lib");
import("oscillators.lib");

gain = hslider( "[0]gain", 0.1, 0.0, 1.0, 0.001 ) : si.smoo;

//============================================================

carrier = hslider( "[1]freq", 1, 20, 4000, 0.001 ) : si.smoo ;

multiplyer = hslider( "[2]multiplyer", 1, 1, 2, 0.01 ) : si.smoo ;
modulation = osc(carrier * multiplyer) * 0.5 + 0.5; //scaled and offset

modDepth = hslider( "[3]mod depth", 1, 0, 1, 0.01 ) : si.smoo ;

//============================================================

monoMix = triangle(carrier) * (modulation * modDepth) * gain; 

process =  monoMix <: _,_;