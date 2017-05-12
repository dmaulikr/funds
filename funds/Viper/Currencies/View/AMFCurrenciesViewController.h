//
//  AMFCurrenciesViewController.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFCurrenciesViewInput.h"
#import "AMFThemeBaseController.h"

@protocol AMFCurrenciesViewOutput;

@interface AMFCurrenciesViewController : AMFThemeBaseController <AMFCurrenciesViewInput>

@property (nonatomic, strong) id<AMFCurrenciesViewOutput> output;

@end
