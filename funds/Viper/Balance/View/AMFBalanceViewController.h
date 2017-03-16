//
//  AMFBalanceViewController.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFBalanceViewInput.h"
#import "AMFThemeBaseController.h"

@class AMFTheme;
@protocol AMFBalanceViewOutput;

@interface AMFBalanceViewController : AMFThemeBaseController <AMFBalanceViewInput>

@property (nonatomic, strong) id<AMFBalanceViewOutput> output;

@end
