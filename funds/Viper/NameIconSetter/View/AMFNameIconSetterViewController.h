//
//  AMFNameIconSetterViewController.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMFThemeBaseController.h"
#import "AMFNameIconSetterViewInput.h"

@protocol AMFNameIconSetterViewOutput;

@interface AMFNameIconSetterViewController : AMFThemeBaseController <AMFNameIconSetterViewInput>

@property (nonatomic, strong) id<AMFNameIconSetterViewOutput> output;

@end
