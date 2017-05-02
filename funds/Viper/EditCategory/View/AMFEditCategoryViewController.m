//
//  AMFEditCategoryViewController.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryViewController.h"

#import "AMFEditCategoryViewOutput.h"

@implementation AMFEditCategoryViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы AMFEditCategoryViewInput

- (void)setupInitialState {
	// setup anything needed for view for its functioning
}

@end
