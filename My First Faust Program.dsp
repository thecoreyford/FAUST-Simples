/*
	My First Faust Program
	Corey Ford 
	27 April 2018

	Based on: Faust Hero in 2 Hours!
	Link: https://ccrma.stanford.edu/~rmichon/faustTutorials/ 
*/

import("stdfaust.lib");

//hslider("paramName",default,min,max,step)

ctFreq = hslider("[0]cutoffFrequency",500,50,10000,0.01) : si.smoo;
q = hslider("[1]q", 5, 1, 30, 0.01) : si.smoo;
gain = hslider("[2]gain", 1, 0, 1, 0.01) : si.smoo;

t = button("[3]gate") : si.smoo;

monoMix = no.noise : fi.resonlp(ctFreq, q, gain)*t ;

process =  monoMix <: dm.zita_rev1;