/*
	One Zero
	Corey Ford 
	20 July 2018

	"One Zero" Lowpass / Highpass Filter
	@see Filters.dsp

*/

import("all.lib");

filter = _ <: _,_'*b1 :> _
with{
	b1 = hslider("b1", 0, -1, 1, 0.01);
};

process = _ : filter <: _,_; 

