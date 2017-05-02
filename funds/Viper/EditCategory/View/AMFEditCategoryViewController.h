//
//  AMFEditCategoryViewController.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AMFEditCategoryViewInput.h"

@protocol AMFEditCategoryViewOutput;

@interface AMFEditCategoryViewController : UIViewController <AMFEditCategoryViewInput>

@property (nonatomic, strong) id<AMFEditCategoryViewOutput> output;

@end
