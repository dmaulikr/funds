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

#pragma mark - Методы AMFBalanceModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы AMFBalanceViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Методы AMFBalanceInteractorOutput

@end
