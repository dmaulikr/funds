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
    BOOL _selectSecondWallet;
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
    self.view.selectedMoveIntoWallet = [self.interactor currentWWallet];
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
    _selectSecondWallet = NO;
    [self.router showWalletChooserWithWalletSelected:[self.interactor currentWallet]
                                           andOutput:self];
}

- (void)changeWalletMoveTo {
    _selectSecondWallet = YES;
    [self.router showWalletChooserWithWalletSelected:[self.interactor currentWallet]
                                           andOutput:self];
}

- (void)nullifyWalletMoveTo {
    [self.interactor moveIntoWallet:nil];
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
    NSError *er;
    // try to set first or second wallet
    // and find out if there were any errors
    if (_selectSecondWallet) {
        er = [self.interactor moveIntoWallet:wallet];
    }
    else {
        er = [self.interactor selectedWallet:wallet];
    }

    if (!er) { // no errors? proceed with setup of first/second wallets
        if (_selectSecondWallet)
            self.view.selectedMoveIntoWallet = wallet;
        else
            self.view.selectedWallet = wallet;
    }
    else { // error occured? show it to user and exit
        [self.router showErrorWithMessage:[er.userInfo objectForKey:@"msg"]];
        return;
    }
    [self.view refreshView];
}

@end
