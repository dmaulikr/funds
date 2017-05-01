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
#import "AMFChooseCategoryModuleOutput.h"
#import "AMFCategoryProtocol.h"

static NSString *const categoryCellIndentifier = @"chooseCategoryCell";

@implementation AMFChooseCategoryPresenter

#pragma mark - Methods of AMFChooseCategoryModuleInput

- (void)configureModuleWithCategorySelected:(id<AMFCategoryProtocol>)category {
    [self.interactor receiveAllCategories];
}

#pragma mark - Methods of AMFChooseCategoryViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
}

- (void)categorySelected:(id<AMFCategoryProtocol>)category {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults persistObjAsData:category forKey:kLastCategory];
    [self.moduleOutput categoryChosen:category];
    [self.router closeMe];
}

#pragma mark - Methods of AMFChooseCategoryInteractorOutput

- (void)categoriesReceived:(NSArray*)categories {
    self.view.categories = categories;
    [self.view refreshContents];
}

@end
