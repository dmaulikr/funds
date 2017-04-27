//
//  AMFChooseCategoryModuleOutput.h
//  funds
//
//  Created by Michael on 26.04.17.
//  Copyright © 2017 micartu. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "AMFCategoryProtocol.h"

@protocol AMFChooseCategoryModuleOutput <RamblerViperModuleOutput>

/**
 * gives feedback about which category was chosen by user
 */
- (void)categoryChosen:(id<AMFCategoryProtocol>)category;

@end
