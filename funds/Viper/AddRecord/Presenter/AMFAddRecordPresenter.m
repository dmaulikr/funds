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

@interface AMFAddRecordPresenter () {
    BOOL _withdrawalSelection;
}
@end

@implementation AMFAddRecordPresenter

#pragma mark - Methods of AMFAddRecordModuleInput

- (void)configureModule {
    // try to find out which category was used last
}

#pragma mark - Methods of AMFAddRecordViewOutput

- (void)didTriggerViewReadyEvent {
    self.view.selectedCategory = [self.interactor currentCategory];
    self.view.selectedCurrency = [self.interactor currentCurrency];
    self.view.selectedWallet = [self.interactor currentWallet];
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
    self.view.selectedCurrency = [self.interactor nextCurrency];
    [self.view refreshView];
}

- (void)changeCatogory {
    [self.router showCategoryChooserWithCategorySelected:[self.interactor currentCategory]
                                               andOutput:self];
}

- (void)changeWallet {
    _withdrawalSelection = NO;
    [self.router showWalletChooserWithWalletSelected:[self.interactor currentWallet]
                                           andOutput:self];
}

#pragma mark - Methods of AMFAddRecordInteractorOutput

- (void)recordCreatedWithError:(NSError*)er {
    if (!er)
        [self.router closeMe];
    else {
        [self.router showErrorWithMessage:[er.userInfo objectForKey:@"msg"]];
    }
}


#pragma mark - Methods of AMFChooseCategoryModuleOutput

- (void)categoryChosen:(id<AMFCategoryProtocol>)category {
    [self.interactor selectedCategory:category];
    self.view.selectedCategory = category;
    [self.view refreshView];
}


#pragma mark - Methods of AMFChooseWalletModuleOutput

- (void)walletChosen:(id<AMFWalletProtocol>)wallet {
    if (_withdrawalSelection)
        [self.interactor withdrawalWallet:wallet];
    else {
        [self.interactor selectedWallet:wallet];
        self.view.selectedWallet = [self.interactor currentWallet];
    }
    [self.view refreshView];
}

@end
