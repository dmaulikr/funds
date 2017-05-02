//
//  AMFEditCategoryModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFCategoryProtocol;

@protocol AMFEditCategoryModuleInput <RamblerViperModuleInput>

/**
 * @author Michael Artuerhof
 * Method initializes the starting configuration of the module
 * @param category to be edited
 */
- (void)configureModuleWithCategoryName:(id<AMFCategoryProtocol>)category;

@end
