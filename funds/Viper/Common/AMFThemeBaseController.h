//
//  AMFThemeBaseController.h
//  iMemor
//
//  Created by Michael Artuerhof on 16.03.2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMFThemeable.h"

@interface AMFThemeBaseController : UIViewController <AMFThemeable>

@property (strong, nonatomic) UIActivityIndicatorView *activeIndicator;

- (void)setupInitialState;

@end
