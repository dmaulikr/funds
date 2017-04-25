//
//  AMFAddRecordViewController.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFAddRecordViewInput.h"
#import "AMFThemeBaseController.h"

@protocol AMFAddRecordViewOutput;

@interface AMFAddRecordViewController : AMFThemeBaseController <AMFAddRecordViewInput>

@property (nonatomic, strong) id<AMFAddRecordViewOutput> output;

@end
