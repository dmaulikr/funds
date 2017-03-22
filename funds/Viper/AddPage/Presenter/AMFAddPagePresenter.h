//
//  AMFAddPagePresenter.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageViewOutput.h"
#import "AMFAddPageInteractorOutput.h"
#import "AMFAddPageModuleInput.h"

@protocol AMFAddPageViewInput;
@protocol AMFAddPageInteractorInput;
@protocol AMFAddPageRouterInput;
@protocol AMFAddPageModuleOutput;

@interface AMFAddPagePresenter : NSObject <AMFAddPageModuleInput, AMFAddPageViewOutput, AMFAddPageInteractorOutput>

@property (nonatomic, weak) id<AMFAddPageViewInput> view;
@property (nonatomic, strong) id<AMFAddPageInteractorInput> interactor;
@property (nonatomic, strong) id<AMFAddPageRouterInput> router;

@property (nonatomic, weak) id<AMFAddPageModuleOutput> moduleOutput;

@end
