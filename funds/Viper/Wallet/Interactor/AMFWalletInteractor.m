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

@implementation AMFWalletInteractor

#pragma mark - Методы AMFWalletInteractorInput

- (void)receiveAllWallets {
    NSArray *w = [self.storage grabAllWallets];
    [self.output walletsReceived:w];
}

@end
