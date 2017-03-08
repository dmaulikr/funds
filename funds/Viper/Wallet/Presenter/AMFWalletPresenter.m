//
//  AMFWalletPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletPresenter.h"

#import "AMFWalletViewInput.h"
#import "AMFWalletInteractorInput.h"
#import "AMFWalletRouterInput.h"

@implementation AMFWalletPresenter

#pragma mark - Методы AMFWalletModuleInput

- (void)configureModule {
    // Стартовая конфигурация модуля, не привязанная к состоянию view
}

#pragma mark - Методы AMFWalletViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Методы AMFWalletInteractorOutput

@end
