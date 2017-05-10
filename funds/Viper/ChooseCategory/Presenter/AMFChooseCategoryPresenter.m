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

@interface AMFChooseCategoryPresenter() {
    id<AMFCategoryProtocol> _category;
    BOOL _addCategory;
}

@end

@implementation AMFChooseCategoryPresenter

#pragma mark - Methods of AMFChooseCategoryModuleInput

- (void)configureModuleWithCategorySelected:(id<AMFCategoryProtocol>)category {
    self.view.selectedCategory = category;
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

- (void)editCategory:(id<AMFCategoryProtocol>)category {
    _category = category;
    [self.router showNameIconSetterWithName:category.name
                                    andIcon:category.icon_path
                                  andOutput:self];
}

- (void)addCategory {
    _category = nil;
    [self.router showNameIconSetterWithName:@"?"
                                    andIcon:@""
                                  andOutput:self];
}

#pragma mark - Methods of AMFChooseCategoryInteractorOutput

- (void)categoriesReceived:(NSArray*)categories {
    self.view.categories = categories;
    [self.view refreshContents];
}

#pragma mark - Methods of AMFNameIconSetterModuleOutput

- (void)editFinishedWithName:(NSString*)name andIcon:(NSString*)icon {
    if (_category) // edit category
        [self.interactor changeCategory:_category withName:name andIcon:icon];
    else  // create category
        [self.interactor createCategoryWithName:name andIcon:icon];
    [self.interactor receiveAllCategories];
}

@end
