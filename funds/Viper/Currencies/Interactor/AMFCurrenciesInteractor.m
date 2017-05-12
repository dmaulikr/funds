//
//  AMFCurrenciesInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrenciesInteractor.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFCurrenciesInteractorOutput.h"
#import "AMFStorageHandlerProtocol.h"

@implementation AMFCurrenciesInteractor

#pragma mark - Methods of AMFCurrenciesInteractorInput

- (void)receiveAllCurrencies {
    NSArray *c = [self.storage grabAllCurrencies];
    [self.output currenciesReceived:c];
}

- (void)changeCurrency:(id<AMFCurrencyProtocol>)currency withSymbol:(NSString*)name {
    [self.storage updateCurrency:currency withSymbol:name];
}

@end
