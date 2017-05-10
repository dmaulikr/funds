//
//  AMFFlowPresenter.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowPresenter.h"

#import "AMFFlowViewInput.h"
#import "AMFFlowInteractorInput.h"
#import "AMFFlowRouterInput.h"
#import "AMFPageProtocol.h"
#import "AMFCashProtocol.h"

@implementation AMFFlowPresenter

@synthesize page;

#pragma mark - Methods AMFFlowModuleInput

- (void)configureModule {
}

#pragma mark - Methods AMFFlowInteractorOutput

- (void)receivedRecords:(NSArray*) records {
    self.view.records = records;
    [self.view refreshContents];
}

- (void)receivedValidPage:(id<AMFPageProtocol>)p {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults persistObjAsData:p forKey:kLastPage];
    self.page = p;
    [self.view setToolbarTitle:self.page.name];
    [self.interactor askForDataWithPage:p];
}

#pragma mark - Methods AMFFlowViewOutput

- (void)setupView {
    // ask for data to be shown in view
    if (self.page == nil)
        [self.interactor askForAnyValidPage];
    else
        [self receivedValidPage:self.page];
}

- (void)addClicked {
    [self.router showAddRecordWithOutput:self];
}

- (void)cellSelected:(NSUInteger)index {
    id<AMFCashProtocol> cash = [self.interactor cashFlowWithIndex:index];
    [self.router showEditRecordWithCash:cash andOutput:self];
}

- (void)cellToDelete:(NSUInteger)index {
    [self.router showAlternativeDialogWithMessage:AMFLocalize(@"Are you sure?")
                                        andAction:^(UIAlertAction *action) {
                                            [self.interactor removeCashFlowWithIndex:index];
                                            [self setupView];
                                        }];
}

- (void)choosePage {
    [self.router showPageChooserWithPageSelected:self.page
                                       andOutput:self];
}


#pragma mark - Methods AMFPageChooserModuleOutput

- (void)pageWasChosen:(id<AMFPageProtocol>)p {
    [self receivedValidPage:p];
}

#pragma mark - State

- (void)didTriggerViewReadyEvent {
    [self.view setupInitialState];
}

#pragma mark - Methods AMFAddRecordModuleOutput

- (void)doneRecordEditing {
    [self setupView];
}

@end
