//
//  AMFNameIconSetterModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFNameIconSetterModuleInput <RamblerViperModuleInput>

/**
 @author Michael Artuerhof

 Method initializes the starting configuration of the module
 */
- (void)configureModuleWithName:(NSString*)name andIcon:(NSString*)icon;

/**
 * shows different sets of icons to choose from
 */
- (void)configureModuleWithName:(NSString*)name andIcon:(NSString*)icon andIconSet:(NSInteger)iset;

/**
 * shows module with label's name changed and its contents filled with name
 */
- (void)configureModuleWithLabel:(NSString*)label andName:(NSString*)name;

@end
