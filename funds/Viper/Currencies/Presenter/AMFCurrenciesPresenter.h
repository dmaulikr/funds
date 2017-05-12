//
//  AMFCurrenciesPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrenciesViewOutput.h"
#import "AMFCurrenciesInteractorOutput.h"
#import "AMFCurrenciesModuleInput.h"

@protocol AMFCurrenciesViewInput;
@protocol AMFCurrenciesInteractorInput;
@protocol AMFCurrenciesRouterInput;

@interface AMFCurrenciesPresenter : NSObject <AMFCurrenciesModuleInput, AMFCurrenciesViewOutput, AMFCurrenciesInteractorOutput>

@property (nonatomic, weak) id<AMFCurrenciesViewInput> view;
@property (nonatomic, strong) id<AMFCurrenciesInteractorInput> interactor;
@property (nonatomic, strong) id<AMFCurrenciesRouterInput> router;

@end
