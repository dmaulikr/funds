//
//  AMFAddPageViewController.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFAddPageViewInput.h"
#import "AMFThemeBaseController.h"

@protocol AMFAddPageViewOutput;

@interface AMFAddPageViewController : AMFThemeBaseController <AMFAddPageViewInput>

@property (nonatomic, strong) id<AMFAddPageViewOutput> output;

@end
