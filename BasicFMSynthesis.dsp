/*
	Basic FM Synthesis
	Corey Ford 
	27 April 2018
*/

import("stdfaust.lib");
import("signals.lib");
import("oscillators.lib");

gain = *( hslider( "[0]gain", 0.0, 0.0, 1.0, 0.001 ) : si.smoo );

//================================================================

carrierFreq = hslider( "[1]carrier freq", 50, 50, 1000, 0.01 ) : si.smoo; //keyboard?
modFreq = hslider( "[2]mod freq", 0.1, 0.1, 100, 0.01 ) : si.smoo;
modIndex = hslider( "[3]mod index", 0.0, 0.0, 16, 0.01 ) : si.smoo ;

modOsc = osc(modFreq);
carrierOscIn = ( modOsc * (modIndex * modFreq) ) + carrierFreq;

//================================================================

monoMix = osc(carrierOscIn) : gain; 

process =  monoMix <: _,_;