//
//  AMFPageChooserModuleOutput.h
//  funds
//
//  Created by Michael on 11.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFPageProtocol;

@protocol AMFPageChooserModuleOutput <RamblerViperModuleOutput>

/**
 tells which page was chosen
 */
-(void) pageWasChosen:(id<AMFPageProtocol>)page;

@end
