//
//  AnimationWindow.h
//  CoreWindowAnimation
//
//  Created by CCoding on 20.10.11.
//  Copyright (c) 2011 CCoding. All rights reserved.
//

#import "AnimationWindow.h"
#import "CGSPrivate.h"

@implementation AnimationWindow
//Try fullscreen if you are running Mac OS X 10.7 Lion
- (IBAction)applySettings:(id)sender {
    
    int handle=-1;
	CGSTransitionSpec spec;
    
	spec.unknown1=0;
///////////////////////TRANSITION TYPE RADIOS///////////////////////
//Some of the transitions can't use options
    
    switch ([[transitionTypeRadios selectedCell] tag])
	{
		case 0:
		{
			spec.type=CGSNone; //For more information see CGSPrivate.h
            break;
		}
		case 1:
		{
			spec.type=CGSFade; 
			break;
		}
        case 2:
		{
			spec.type=CGSZoom; 
			break;
		}
        case 3:
		{
			spec.type=CGSReveal; 
			break;
		}
        case 4:
		{
			spec.type=CGSSlide; 
			break;
		}
        case 5:
		{
			spec.type=CGSWarpFade; 
			break;
		}
        case 6:
		{
			spec.type=CGSSwap; 
			break;
		}
        case 7:
		{
			spec.type=CGSCube; 
			break;
		}
        case 8:
		{
			spec.type=CGSWarpSwitch; 
			break;
		}
        case 9:
		{
			spec.type=CGSFlip; 
			break;
		}
	}
    
/////////////////OPTION RADIOS///////////////////////////
//Some of the options might be the same depending on the Carbon.framework
    
    switch ([[optionRadios selectedCell] tag])
	{
		case 0:
		{
			spec.option=CGSDown | (1<<7); //For more information see CGSPrivate.h
            break;
		}
		case 1:
		{
			spec.option=CGSRight | (1<<7);
			break;
		}
        case 2:
		{
			spec.option=CGSInRight | (1<<7);
			break;
		}
        case 3:
		{
			spec.option=CGSBottomLeft | (1<<7);
			break;
		}
        case 4:
		{
			spec.option=CGSBottomRight | (1<<7);
			break;
		}
        case 5:
		{
			spec.option=CGSDownTopRight | (1<<7); 
			break;
		}
        case 6:
		{
			spec.option=CGSUp | (1<<7); 
			break;
		}
        case 7:
		{
			spec.option=CGSTopLeft | (1<<7); 
			break;
		}
        case 8:
		{
			spec.option=CGSTopRight | (1<<7); 
			break;
		}
        case 9:
		{
			spec.option=CGSUpBottomRight | (1<<7); 
			break;
		}
        case 10:
		{
			spec.option=CGSInBottom | (1<<7); 
			break;
		}
        case 11:
		{
			spec.option=CGSLeftBottomRight | (1<<7); 
			break;
		}
        case 12:
		{
			spec.option=CGSRightBottomLeft | (1<<7); 
			break;
		}
        case 13:
		{
			spec.option=CGSInBottomRight | (1<<7); 
			break;
		}
        case 14:
		{
			spec.option=CGSInOut | (1<<7); 
			break;
		}
        case 15:
		{
			spec.option=CGSLeft | (1<<7); 
			break;
		}
	}
    
///////////////Additional Settings///////////////////
	spec.backColour=0;
	spec.wid=[self windowNumber];
    
	CGSConnection cgs= _CGSDefaultConnection();
    
	// Create a transition
	CGSNewTransition(cgs, &spec, &handle);
    
	//What happens after the animation...
	[self display];
    
	CGSInvokeTransition(cgs, handle, 1);
    
	//Wait for the animation until you can continue
	usleep((useconds_t)(1000000));
    
    //	Release the variables
	CGSReleaseTransition(cgs, handle);
	handle=0;

}

//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
//For a clear version copy the following and apply your own settings//
//////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////
/*
 - (IBAction)startAnimation:(id)sender{
 
 int handle=-1;
 CGSTransitionSpec spec;
 
 spec.unknown1=0;
 spec.type=CGSCube;
 spec.option=CGSLeft | (1<<7);
 spec.backColour=0;
 spec.wid=[self windowNumber];
 
 CGSConnection cgs= _CGSDefaultConnection();
 CGSNewTransition(cgs, &spec, &handle);
 
 [self display];
 
 CGSInvokeTransition(cgs, handle, 1);

 usleep((useconds_t)(1000000));

 CGSReleaseTransition(cgs, handle);
 
 handle=0;
}
*/

@end
