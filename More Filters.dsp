/*
	More Filters IN PROGRESS
	Corey Ford 
	12 June 2018

	Based on explanations in "Audio processes: musical analysis, modification, synthesis, and control" by David Creasey. 
*/

import("all.lib");

////"One Zero" Lowpass / Highpass Filter FIR
//FIROnePole = _ <: _,_'*b1 :> _
//with{
//	b1 = hslider("b1", 0, -1, 1, 0.01);
//};

//=================================================

////One Pole first order low pass filter
//fc = hslider("fc", 20, 20, 200000, 0.1); //logaritmic?	

//c = 2 - cos( (2 * PI * fc) / SR);
//b1 = sqrt( (c * c) - 1 ) - c;
//a0 = 1 + b1; 

//OnePole = _ * a0 : + ~ (_' : *( -1 * b1 ) );

//process = noise :  OnePole <: _,_; 

//=================================================

//More advanced first order low pass filter - page 173
fc = hslider("fc", 20, 20, 200000, 0.1); //logaritmic?	

phase = (2 * PI * fc) / SR;
b1 = ( -1 * cos(phase) ) / ( 1 + sin(phase) );
a0 = 0.5 * (1 + b1);
a1 = a0; 


//forward = _' : (_ * a1);
//adv = ( _ * a0 ) <: forward + ~ ( _' : *( -1 * b1 ) );


//=================================================

process = 0; //noise : adv; 









