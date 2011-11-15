//
//  AnimationWindow.h
//  CoreWindowAnimation
//
//  Created by CCoding on 20.10.11.
//  Copyright (c) 2011 CCoding. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AnimationWindow : NSWindow { 
    
    IBOutlet NSMatrix *transitionTypeRadios;
    IBOutlet NSMatrix *optionRadios;

}

- (IBAction)applySettings:(id)sender;



@end
