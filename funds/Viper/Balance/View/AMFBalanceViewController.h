//
//  AMFBalanceViewController.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFBalanceViewInput.h"

@class AMFTheme;
@protocol AMFBalanceViewOutput;

@interface AMFBalanceViewController : UIViewController <AMFBalanceViewInput>

@property (nonatomic, strong) id<AMFBalanceViewOutput> output;

/**
 theme to be applied to the view
 */
@property (nonatomic, strong) AMFTheme *theme;

@end
