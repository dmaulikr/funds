//
//  AMFChooseCategoryViewController.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryViewController.h"

#import "AMFChooseCategoryViewOutput.h"

static NSString *const chooseCatCellIndentifier = @"chooseCategoryCell";

@implementation AMFChooseCategoryViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы AMFChooseCategoryViewInput

- (void)setupInitialState {
	// setup anything needed for view for its functioning
}

@end
