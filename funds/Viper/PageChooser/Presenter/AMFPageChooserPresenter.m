//
//  AMFPageChooserPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserPresenter.h"

#import "AMFPageChooserViewInput.h"
#import "AMFPageChooserInteractorInput.h"
#import "AMFPageChooserRouterInput.h"
#import "AMFPageChooserModuleOutput.h"
#import "AMFPageProtocol.h"

@implementation AMFPageChooserPresenter

#pragma mark - Methods of AMFPageChooserModuleInput

- (void)configureModuleWithPageSelected:(id<AMFPageProtocol>)page {
    self.view.selectedPage = page;
}

#pragma mark - Methods of AMFPageChooserViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    // grab all needed data for view
    [self.interactor receiveAllPages];
}

- (void)cellSelected: (NSUInteger) index {
    id<AMFPageProtocol> page = [self.view.pages objectAtIndex:index];
    [self.moduleOutput pageWasChosen:page];
    [self.router closeDialog];
}

- (void)cancelAction {
    [self.router closeDialog];
}

#pragma mark - Methods of AMFPageChooserInteractorOutput

-(void) receivedPages:(NSArray*) pages {
    self.view.pages = pages;
    [self.view refreshContents];
    [self.view placeSelectedPageAtCenter];
}
@end
