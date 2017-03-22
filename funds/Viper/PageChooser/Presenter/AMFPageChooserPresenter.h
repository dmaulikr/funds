//
//  AMFPageChooserPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserViewOutput.h"
#import "AMFPageChooserInteractorOutput.h"
#import "AMFPageChooserModuleInput.h"
#import "AMFAddPageModuleOutput.h"

@protocol AMFPageChooserViewInput;
@protocol AMFPageChooserInteractorInput;
@protocol AMFPageChooserRouterInput;
@protocol AMFPageChooserModuleOutput;

@interface AMFPageChooserPresenter : NSObject <AMFPageChooserModuleInput,
AMFPageChooserViewOutput,
AMFAddPageModuleOutput,
AMFPageChooserInteractorOutput>

@property (nonatomic, weak) id<AMFPageChooserViewInput> view;
@property (nonatomic, strong) id<AMFPageChooserInteractorInput> interactor;
@property (nonatomic, strong) id<AMFPageChooserRouterInput> router;
@property (nonatomic, weak) id<AMFPageChooserModuleOutput> moduleOutput;

@end
