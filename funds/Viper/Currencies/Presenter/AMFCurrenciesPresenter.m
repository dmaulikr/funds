//
//  AMFCurrenciesPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrenciesPresenter.h"

#import "AMFCurrenciesViewInput.h"
#import "AMFCurrenciesInteractorInput.h"
#import "AMFCurrenciesRouterInput.h"

@interface AMFCurrenciesPresenter () {
    id<AMFCurrencyProtocol> _currency;
    BOOL _updated;
}


@end

@implementation AMFCurrenciesPresenter

#pragma mark - Methods of AMFCurrenciesModuleInput

- (void)configureModule {
    // the starting config of the module
}

#pragma mark - Methods of AMFCurrenciesViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.interactor receiveAllCurrencies];
    _updated = YES;
}

- (void)updateDataBeforeViewWillAppear {
    if (!_updated) {
        _updated = YES;
        [self.interactor receiveAllCurrencies];
    }
}

- (void)cellSelected:(NSUInteger)index {
    _currency = self.view.records[index];
    [self.router showEditorWithLabel:AMFLocalize(@"Symbol:")
                         andContents:_currency.symbol
                           andOutput:self];
    _updated = NO;
}

#pragma mark - Methods of AMFCurrenciesInteractorOutput

- (void)currenciesReceived:(NSArray*)c {
    self.view.records = c;
    [self.view refreshContents];
}

#pragma mark - Methods of AMFNameIconSetterModuleOutput

- (void)editFinishedWithName:(NSString*)name andIcon:(NSString*)icon {
    if (_currency)
        [self.interactor changeCurrency:_currency withSymbol:name];
}

@end
