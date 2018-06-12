/*
	Filters
	Corey Ford 
	11 June 2018

	Basic filters from "8. One Zero Lowpass/Highpass Filter, Feed-Forward Comb Filter and Simple Flanger" found here: https://ccrma.stanford.edu/~rmichon/faustWorkshops/course2015/

*/

import("all.lib");

//"One Zero" Lowpass / Highpass Filter 
/*
filter = _ <: _,_'*b1 :> _
with{
	b1 = hslider("b1", 0, -1, 1, 0.01);
};

process = noise : filter <: _,_; 
*/

//Feed Forward Comb Filter
/*
//The more samples the more ups and downs 
filter = _ <: _,delay(65536,N)*b1 :> _
with{
	b1 = hslider("b1", 0, -1, 1, 0.01);
	N = hslider("N",1,1,500,1);
};

process = 0;//noise : filter <: _,_; 
*/

//Simple Feed-Forward Flanger
flange = _ <: _,fdelay(65536,N)*b1 :> _
with{
	b1 = hslider("b1", 0, 1, 1, 0.01);
	modFreq = hslider("Mod Freq", 2, 1, 15, 0.01) : smoo;
	depth = hslider("Depth", 1,1,100,0.1) : smoo;
	N = osc(modFreq) * 0.5 + 0.51 : *(depth) : smoo;
};

process = noise : flange <: _,_; 
