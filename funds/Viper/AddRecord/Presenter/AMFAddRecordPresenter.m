//
//  AMFAddRecordPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordPresenter.h"

#import "AMFAddRecordViewInput.h"
#import "AMFAddRecordInteractorInput.h"
#import "AMFAddRecordRouterInput.h"

@implementation AMFAddRecordPresenter

#pragma mark - Methods of AMFAddRecordModuleInput

- (void)configureModule {
    // try to find out which category was used last
}

#pragma mark - Methods of AMFAddRecordViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)createRecordWithTitle:(NSString*)amount andDescription:(NSString*)descr {
    if (!amount.length) {
        [self.router showErrorWithMessage:AMFLocalize(@"no amount!")];
        return;
    }
    [self.interactor addRecordWithAmount:[amount doubleValue] andDescription:descr];
}

- (void)changeWalletCurrency {
    
}

- (void)changeInputCurrency {
    
}

- (void)changeCatogory {
    // open another module
}

- (void)changeWallet {
    // open another module
}

#pragma mark - Methods of AMFAddRecordInteractorOutput

- (void)recordCreatedWithError:(NSError*)er {
    if (!er)
        [self.router closeMe];
    else {
        [self.router showErrorWithMessage:[er.userInfo objectForKey:@"msg"]];
    }
}

@end