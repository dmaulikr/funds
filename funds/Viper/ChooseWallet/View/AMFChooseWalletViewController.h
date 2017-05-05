//
//  AMFChooseWalletViewController.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFChooseWalletViewInput.h"
#import "AMFThemeBaseController.h"

@protocol AMFChooseWalletViewOutput;

@interface AMFChooseWalletViewController : AMFThemeBaseController <AMFChooseWalletViewInput>

@property (nonatomic, strong) id<AMFChooseWalletViewOutput> output;

@end
