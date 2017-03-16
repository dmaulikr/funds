//
//  AMFPageChooserViewController.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFPageChooserViewInput.h"
#import "AMFThemeBaseController.h"

@protocol AMFPageChooserViewOutput;

@interface AMFPageChooserViewController : AMFThemeBaseController <AMFPageChooserViewInput>

@property (nonatomic, strong) id<AMFPageChooserViewOutput> output;

@end
