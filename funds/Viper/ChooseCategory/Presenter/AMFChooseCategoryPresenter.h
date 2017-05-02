//
//  AMFChooseCategoryPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryViewOutput.h"
#import "AMFChooseCategoryInteractorOutput.h"
#import "AMFChooseCategoryModuleInput.h"
#import "AMFEditCategoryModuleOutput.h"

@protocol AMFChooseCategoryViewInput;
@protocol AMFChooseCategoryInteractorInput;
@protocol AMFChooseCategoryRouterInput;
@protocol AMFChooseCategoryModuleOutput;

@interface AMFChooseCategoryPresenter : NSObject <AMFChooseCategoryModuleInput,
AMFChooseCategoryViewOutput,
AMFEditCategoryModuleOutput,
AMFChooseCategoryInteractorOutput>

@property (nonatomic, weak) id<AMFChooseCategoryViewInput> view;
@property (nonatomic, strong) id<AMFChooseCategoryInteractorInput> interactor;
@property (nonatomic, strong) id<AMFChooseCategoryRouterInput> router;
@property (nonatomic, weak) id<AMFChooseCategoryModuleOutput> moduleOutput;

@end
