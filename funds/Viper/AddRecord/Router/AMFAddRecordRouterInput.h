//
//  AMFAddRecordRouterInput.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFAlertProtocol.h"

@protocol AMFCategoryProtocol;
@protocol AMFChooseCategoryModuleOutput;

@protocol AMFAddRecordRouterInput <AMFAlertProtocol>

- (void)closeMe;

- (void)showCategoryChooserWithCategorySelected:(id<AMFCategoryProtocol>)category
                                      andOutput:(id<AMFChooseCategoryModuleOutput>) output;

@end
