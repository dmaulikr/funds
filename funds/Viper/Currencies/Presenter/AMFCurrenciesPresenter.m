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

@implementation AMFCurrenciesPresenter

#pragma mark - Methods of AMFCurrenciesModuleInput

- (void)configureModule {
    // the starting config of the module
}

#pragma mark - Methods of AMFCurrenciesViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.interactor receiveAllCurrencies];
}

- (void)cellSelected:(NSUInteger)index {
}

#pragma mark - Methods of AMFCurrenciesInteractorOutput

- (void)currenciesReceived:(NSArray*)c {
    self.view.records = c;
    [self.view refreshContents];
}

@end
