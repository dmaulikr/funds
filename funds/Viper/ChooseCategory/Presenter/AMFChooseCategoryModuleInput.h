//
//  AMFChooseCategoryModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFCategoryProtocol;

@protocol AMFChooseCategoryModuleInput <RamblerViperModuleInput>

/**
 * @author Michael Artuerhof
 * configures module with selected page - could be also nil
 * @param category to be selected after module is openned
 */
- (void)configureModuleWithCategorySelected:(id<AMFCategoryProtocol>)category;

@end
