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
#import "AMFEditCategoryModuleOutput.h"
#import "AMFCategoryProtocol.h"

@implementation AMFEditCategoryPresenter

#pragma mark - Methods of AMFEditCategoryModuleInput

- (void)configureModuleWithCategoryName:(id<AMFCategoryProtocol>)category {
    LogDebug(@"Edit category with name: %@; icon_path: %@", category.name, category.icon_path);
    self.view.category = category;
}

#pragma mark - Methods of AMFEditCategoryViewOutput

- (void)didTriggerViewReadyEvent {
	[self.view setupInitialState];
    [self.view refreshContents];
}

- (void)doneEditingWithName:(NSString*)name andIcon:(NSString*)icon {
    [self.interactor changeCategory:self.view.category modifyName:name];
    [self.interactor changeCategory:self.view.category modifyIcon:icon];
    [self.moduleOutput categoryEditingFinished];
    [self.router closeMe];
}

#pragma mark - Methods of AMFEditCategoryInteractorOutput

@end
