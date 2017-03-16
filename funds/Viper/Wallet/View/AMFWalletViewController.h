//
//  AMFWalletViewController.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFWalletViewInput.h"
#import "AMFThemeBaseController.h"

@protocol AMFWalletViewOutput;
@class AMFTheme;

@interface AMFWalletViewController : AMFThemeBaseController <AMFWalletViewInput>

@property (nonatomic, strong) id<AMFWalletViewOutput> output;

@end
