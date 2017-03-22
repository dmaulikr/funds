//
//  AMFAddPageViewController.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageViewController.h"

#import "AMFAddPageViewOutput.h"

@implementation AMFAddPageViewController

#pragma mark - Live cycle methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Methods of AMFAddPageViewInput

- (void)setupInitialState {
	// initial setup of the view
}

#pragma mark - Themes

- (void)applyTheme {
    [super applyTheme];
}

@end
