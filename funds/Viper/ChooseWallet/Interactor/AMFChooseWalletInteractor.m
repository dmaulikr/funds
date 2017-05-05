//
//  AMFChooseWalletInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseWalletInteractor.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFChooseWalletInteractorOutput.h"

@implementation AMFChooseWalletInteractor

#pragma mark - Methods of AMFChooseWalletInteractorInput

- (void)receiveAllWallets {
    NSArray *w = [self.storage grabAllWallets];
    [self.output walletsReceived:w];
}

@end
