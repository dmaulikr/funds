//
//  AMFWalletViewController.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFWalletViewInput.h"

@protocol AMFWalletViewOutput;
@class AMFTheme;

@interface AMFWalletViewController : UIViewController <AMFWalletViewInput>

@property (nonatomic, strong) id<AMFWalletViewOutput> output;

/**
 theme to be applied to the view
 */
@property (nonatomic, strong) AMFTheme *theme;

@end
