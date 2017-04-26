//
//  AMFChooseCategoryViewController.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFChooseCategoryViewInput.h"

@protocol AMFChooseCategoryViewOutput;

@interface AMFChooseCategoryViewController : UIViewController <AMFChooseCategoryViewInput>

@property (nonatomic, strong) id<AMFChooseCategoryViewOutput> output;

@end
