/*
	Static FM Synthesis
	Corey Ford 
	27 April 2018

	For another FAUST Project to prove architecture file concept.
*/

import("stdfaust.lib");
import("signals.lib");
import("oscillators.lib");

gain = 0.5;

//================================================================

carrierFreq = 440.0;
modFreq = 20;
modIndex = 6;

modOsc = osc(modFreq);
carrierOscIn = ( modOsc * (modIndex * modFreq) ) + carrierFreq;

//================================================================

monoMix = osc(carrierOscIn) * gain; 

process =  monoMix;