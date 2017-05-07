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
#import "AMFCashProtocol.h"
#import "AMFAddRecordModuleOutput.h"

@interface AMFAddRecordPresenter () {
    BOOL _withdrawalSelection;
    BOOL _createMode;
}
@end

@implementation AMFAddRecordPresenter

#pragma mark - Methods of AMFAddRecordModuleInput

- (void)configureModule {
    _createMode = YES;
}

- (void)configureModuleWithCash:(id<AMFCashProtocol>)cash {
    _createMode = NO;
    [self.interactor setCashForEdit:cash];
    self.view.cash = cash;
}

#pragma mark - Methods of AMFAddRecordViewOutput

- (void)didTriggerViewReadyEvent {
    self.view.selectedCategory = [self.interactor currentCategory];
    self.view.selectedCurrency = [self.interactor currentCurrency];
    self.view.selectedWallet = [self.interactor currentWallet];
	[self.view setupInitialState];
}

- (void)editOfRecordDoneWithTitle:(NSString*)amount andDescription:(NSString*)descr {
    if (!amount.length) {
        [self.router showErrorWithMessage:AMFLocalize(@"no amount!")];
        return;
    }
    if (_createMode)
        [self.interactor addRecordWithAmount:[amount doubleValue] andDescription:descr];
    else
        [self.interactor updateRecordWithAmount:[amount doubleValue] andDescription:descr];
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
    if (!er) {
        [self.moduleOutput doneRecordEditing];
        [self.router closeMe];
    }
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
