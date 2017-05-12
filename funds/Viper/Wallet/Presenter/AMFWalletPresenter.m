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
#import "AMFWalletProtocol.h"

@interface AMFWalletPresenter() {
    id<AMFWalletProtocol> _wallet;
}

@end

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
    _wallet = self.view.records[index];
    [self.router showNameIconSetterWithName:_wallet.name
                                    andIcon:_wallet.icon_path ? _wallet.icon_path : @""
                                  andOutput:self];
}

- (void)editWalletWithIndex:(NSUInteger)index {
}

- (void)addWallet {
    _wallet = nil;
    [self.router showNameIconSetterWithName:@""
                                    andIcon:@""
                                  andOutput:self];
}

#pragma mark - Методы AMFWalletInteractorOutput

- (void)walletsReceived:(NSArray*)w {
    self.view.records = w;
    [self.view refreshContents];
}

#pragma mark - Methods of AMFNameIconSetterModuleOutput

- (void)editFinishedWithName:(NSString*)name andIcon:(NSString*)icon {
    if (_wallet) // edit of an existing wallet
        [self.interactor changeWallet:_wallet withName:name andIcon:icon];
    else // wallet's creation
        [self.interactor createWalletWithName:name andIcon:icon];

    [self.interactor receiveAllWallets];
}

@end
