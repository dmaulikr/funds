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
}

#pragma mark - Методы AMFWalletViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.interactor receiveAllWallets];
}

- (void)cellSelected:(NSUInteger)index {
}

- (void)editWalletWithIndex:(NSUInteger)index {
}

- (void)addWallet {
    [self.router showErrorWithMessage:@"Add me!"];
}

#pragma mark - Методы AMFWalletInteractorOutput

- (void)walletsReceived:(NSArray*)w {
    self.view.records = w;
    [self.view refreshContents];
}

@end
