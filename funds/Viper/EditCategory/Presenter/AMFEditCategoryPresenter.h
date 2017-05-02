//
//  AMFEditCategoryPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryViewOutput.h"
#import "AMFEditCategoryInteractorOutput.h"
#import "AMFEditCategoryModuleInput.h"

@protocol AMFEditCategoryViewInput;
@protocol AMFEditCategoryInteractorInput;
@protocol AMFEditCategoryRouterInput;

@interface AMFEditCategoryPresenter : NSObject <AMFEditCategoryModuleInput, AMFEditCategoryViewOutput, AMFEditCategoryInteractorOutput>

@property (nonatomic, weak) id<AMFEditCategoryViewInput> view;
@property (nonatomic, strong) id<AMFEditCategoryInteractorInput> interactor;
@property (nonatomic, strong) id<AMFEditCategoryRouterInput> router;

@end
