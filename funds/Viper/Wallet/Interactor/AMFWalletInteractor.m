//
//  AMFWalletInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletInteractor.h"

#import "AMFWalletInteractorOutput.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFWalletProtocol.h"

@implementation AMFWalletInteractor

#pragma mark - Методы AMFWalletInteractorInput

- (void)receiveAllWallets {
    NSArray *w = [self.storage grabAllWallets];
    [self.output walletsReceived:w];
}

- (void)changeWallet:(id<AMFWalletProtocol>)wallet withName:(NSString*)name andIcon:(NSString*)icon {
    [self.storage updateWallet:wallet withName:name andIcon:icon];
}

- (void)createWalletWithName:(NSString*)name andIcon:(NSString*)icon {
    [self.storage createWalletWithName:name andIcon:icon];
}

- (void)deleteWallet:(id<AMFWalletProtocol>)wallet {
    [self.storage removeWallet:wallet];
}

@end
