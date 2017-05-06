//
//  AMFNameIconSetterPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFNameIconSetterViewOutput.h"
#import "AMFNameIconSetterInteractorOutput.h"
#import "AMFNameIconSetterModuleInput.h"

@protocol AMFNameIconSetterViewInput;
@protocol AMFNameIconSetterInteractorInput;
@protocol AMFNameIconSetterRouterInput;
@protocol AMFNameIconSetterModuleOutput;

@interface AMFNameIconSetterPresenter : NSObject <AMFNameIconSetterModuleInput, AMFNameIconSetterViewOutput, AMFNameIconSetterInteractorOutput>

@property (nonatomic, weak) id<AMFNameIconSetterViewInput> view;
@property (nonatomic, strong) id<AMFNameIconSetterInteractorInput> interactor;
@property (nonatomic, strong) id<AMFNameIconSetterRouterInput> router;
@property (nonatomic, weak) id<AMFNameIconSetterModuleOutput> moduleOutput;

@end
