/*
	Feed Forward Comb Filter
	Corey Ford 
	20 July 2018

	@see Filters.dsp

*/

import("all.lib");

//The more samples the more ups and downs 
filter = _ <: _,delay(65536,N)*b1 :> _
with{
	b1 = hslider("b1", 0, -1, 1, 0.01);
	N = hslider("N",1,1,500,1);
};

process = _ : filter <: _,_; 