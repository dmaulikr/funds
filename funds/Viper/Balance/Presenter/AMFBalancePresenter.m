//
//  AMFBalancePresenter.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalancePresenter.h"

#import "AMFBalanceViewInput.h"
#import "AMFBalanceInteractorInput.h"
#import "AMFBalanceRouterInput.h"
#import "AMFBalancePresenter.h"
#import "AMFPageProtocol.h"

@interface AMFBalancePresenter () {
    BOOL _inialized;
}

@end

@implementation AMFBalancePresenter

#pragma mark - Methods of AMFBalanceModuleInput

- (void)configureModule {
    _inialized = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(DBChanged)
                                                 name:kEventRecordAdded
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(DBChanged)
                                                 name:kEventRecordRemoved
                                               object:nil];
}

#pragma mark - Methods of AMFBalanceViewOutput

- (void)setPageForView:(id<AMFPageProtocol>)page {
    [self.interactor makeReportForPage:page];
    [self.view setCurrentPageTitle:[self.interactor currentPage].name];
}

- (void)didTriggerViewReadyEvent {
    if (!_inialized)
        [self configureModule];
	[self.view setupInitialState];
    [self setPageForView:[self.interactor currentPage]];
}

- (void)nextReportButtonPressed {
    [self setPageForView:[self.interactor nextPage]];
}

- (void)prevReportButtonPressed {
    [self setPageForView:[self.interactor prevPage]];
}

#pragma mark - Methods of AMFBalanceInteractorOutput

- (void)reportCompleted:(NSArray*)report {
    self.view.records = report;
    [self.view refreshContents];
}

- (void)availableDirectionsForLeft:(NSString*)left andRight:(NSString*)right {
    [self.view setNamesOfUpperButtons:left andRight:right];
}

#pragma mark - Inner methods

- (void)DBChanged {
    [self setPageForView:[self.interactor currentPage]];
}

@end
