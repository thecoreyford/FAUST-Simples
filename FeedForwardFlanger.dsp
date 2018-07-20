/*
	Feed Forward Flanger
	Corey Ford 
	20 July 2018

	@see Filters.dsp

*/

import("all.lib");

flange = _ <: _,fdelay(65536,N)*b1 :> _
with{
	b1 = hslider("b1", 0, 1, 1, 0.01);
	modFreq = hslider("Mod Freq", 2, 1, 15, 0.01) : smoo;
	depth = hslider("Depth", 1,1,100,0.1) : smoo;
	N = osc(modFreq) * 0.5 + 0.51 : *(depth) : smoo;
};

process = _ : flange <: _,_; 
