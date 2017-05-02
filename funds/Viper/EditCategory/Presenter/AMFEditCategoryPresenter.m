//
//  AMFEditCategoryPresenter.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryPresenter.h"

#import "AMFEditCategoryViewInput.h"
#import "AMFEditCategoryInteractorInput.h"
#import "AMFEditCategoryRouterInput.h"

@implementation AMFEditCategoryPresenter

#pragma mark - Methods of AMFEditCategoryModuleInput

- (void)configureModule {
    // the starting config of the module
}

#pragma mark - Methods of AMFEditCategoryViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

#pragma mark - Methods of AMFEditCategoryInteractorOutput

@end
