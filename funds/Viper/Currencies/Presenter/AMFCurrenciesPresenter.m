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
#import "AMFCurrencyPlain.h"

typedef NS_ENUM(NSInteger, AMFCurChangeType) {
    ChangeTypeSymbol = 0,
    ChangeTypeRate,
    ChangeTypeName,
};

@interface AMFCurrenciesPresenter () {
    id<AMFCurrencyProtocol> _currency;
    BOOL _updated;
    AMFCurChangeType _type;
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
    [self.router showEditOptionsWithActionSymbol:^(UIAlertAction *action) {
        // symbol
        _type = ChangeTypeSymbol;
        [self.router showEditorWithLabel:AMFLocalize(@"Symbol")
                             andContents:_currency.symbol
                               andOutput:self];
    } andActionRate:^(UIAlertAction *action) {
        // rate
        _type = ChangeTypeRate;
        [self.router showEditorWithLabel:AMFLocalize(@"Rate")
                             andContents:[NSString stringWithFormat:@"%g", _currency.rate]
                               andOutput:self];
    } andActionName:^(UIAlertAction *action) {
        // name
        _type = ChangeTypeName;
        [self.router showEditorWithLabel:AMFLocalize(@"Name")
                             andContents:_currency.name
                               andOutput:self];
    }];
    _updated = NO;
}

- (void)addCurrency {
    _currency = nil;
    [self.router showEditorWithLabel:AMFLocalize(@"Name")
                             andContents:@""
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
    if (_currency) {
        AMFCurrencyPlain *cur = [[AMFCurrencyPlain alloc] initWithCurrency:_currency];
        switch(_type) {
            case ChangeTypeSymbol:
                cur.symbol = name;
                break;

            case ChangeTypeName:
                cur.name = name;
                break;

            case ChangeTypeRate:
                cur.rate = [name doubleValue];
                break;
        }
        [self.interactor changeCurrency:_currency withCurrency:cur];
    }
    else
        [self.interactor createCurrencyWithName:name];
}

@end
