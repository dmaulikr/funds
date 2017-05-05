//
//  AMFChooseWalletPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseWalletPresenter.h"

#import "AMFChooseWalletViewInput.h"
#import "AMFChooseWalletInteractorInput.h"
#import "AMFChooseWalletRouterInput.h"
#import "AMFWalletProtocol.h"

@implementation AMFChooseWalletPresenter

#pragma mark - Methods of AMFChooseWalletModuleInput

- (void)configureModuleWithWallet:(id<AMFWalletProtocol>)wallet {
    // the starting config of the module
}

#pragma mark - Methods of AMFChooseWalletViewOutput

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

#pragma mark - Methods of AMFChooseWalletInteractorOutput

- (void)walletsReceived:(NSArray*)w {
    self.view.records = w;
    [self.view refreshContents];
}

@end
