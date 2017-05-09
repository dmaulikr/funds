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

@implementation AMFBalancePresenter

#pragma mark - Methods of AMFBalanceModuleInput

- (void)configureModule {
}

#pragma mark - Methods of AMFBalanceViewOutput

- (void)setPageForView:(id<AMFPageProtocol>)page {
    [self.interactor makeReportForPage:page];
    [self.view setCurrentPageTitle:[self.interactor currentPage].name];
}

- (void)didTriggerViewReadyEvent {
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

@end
