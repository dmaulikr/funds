//
//  AMFChooseCategoryPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryPresenter.h"

#import "AMFChooseCategoryViewInput.h"
#import "AMFChooseCategoryInteractorInput.h"
#import "AMFChooseCategoryRouterInput.h"

@implementation AMFChooseCategoryPresenter

#pragma mark - Methods of AMFChooseCategoryModuleInput

- (void)configureModule {
    // the starting config of the module
}

#pragma mark - Methods of AMFChooseCategoryViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Methods of AMFChooseCategoryInteractorOutput

@end
