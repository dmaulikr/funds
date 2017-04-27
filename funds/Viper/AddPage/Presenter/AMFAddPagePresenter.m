//
//  AMFAddPagePresenter.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPagePresenter.h"

#import "AMFAddPageViewInput.h"
#import "AMFAddPageInteractorInput.h"
#import "AMFAddPageRouterInput.h"
#import "AMFAddPageModuleOutput.h"

@implementation AMFAddPagePresenter

#pragma mark - Methods of AMFAddPageModuleInput

- (void)configureModule {
    // starting configuration of the module
}

#pragma mark - Methods of AMFAddPageViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)doneWithPageName:(NSString*)pname {
    if (!pname.length) {
        [self.router showErrorWithMessage:AMFLocalize(@"no name for page!")];
        return;
    }
    [self.router closeMe];
}

#pragma mark - Methods of AMFAddPageInteractorOutput

@end
