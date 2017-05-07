//
//  AMFChooseCategoryRouterInput.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFAlertProtocol.h"

@protocol AMFCategoryProtocol;
@protocol AMFNameIconSetterModuleOutput;

@protocol AMFChooseCategoryRouterInput <AMFAlertProtocol>

/**
 * closes a dialog which chooses the category
 */
- (void)closeMe;

/**
 * opens a dialog for category editing
 */
- (void)showNameIconSetterWithName:(NSString*)name
                           andIcon:(NSString*)icon
                         andOutput:(id<AMFNameIconSetterModuleOutput>) output;
@end
