//
//  AMFBalancePresenter.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalancePresenter.h"

#import "AMFBalanceViewInput.h"
#import "AMFBalanceInteractorInput.h"
#import "AMFBalanceRouterInput.h"

@implementation AMFBalancePresenter

#pragma mark - Methods of AMFBalanceModuleInput

- (void)configureModule {
}

#pragma mark - Methods of AMFBalanceViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Methods of AMFBalanceInteractorOutput

@end
