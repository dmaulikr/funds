//
//  AMFBalancePresenter.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceViewOutput.h"
#import "AMFBalanceInteractorOutput.h"
#import "AMFBalanceModuleInput.h"

@protocol AMFBalanceViewInput;
@protocol AMFBalanceInteractorInput;
@protocol AMFBalanceRouterInput;

@interface AMFBalancePresenter : NSObject <AMFBalanceModuleInput, AMFBalanceViewOutput, AMFBalanceInteractorOutput>

@property (nonatomic, weak) id<AMFBalanceViewInput> view;
@property (nonatomic, strong) id<AMFBalanceInteractorInput> interactor;
@property (nonatomic, strong) id<AMFBalanceRouterInput> router;

@end
