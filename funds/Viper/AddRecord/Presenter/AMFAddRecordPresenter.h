//
//  AMFAddRecordPresenter.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordViewOutput.h"
#import "AMFAddRecordInteractorOutput.h"
#import "AMFAddRecordModuleInput.h"
#import "AMFChooseCategoryModuleOutput.h"
#import "AMFChooseWalletModuleOutput.h"

@protocol AMFAddRecordViewInput;
@protocol AMFAddRecordInteractorInput;
@protocol AMFAddRecordRouterInput;
@protocol AMFAddRecordModuleOutput;

@interface AMFAddRecordPresenter : NSObject <AMFAddRecordModuleInput,
AMFAddRecordViewOutput,
AMFChooseCategoryModuleOutput,
AMFChooseWalletModuleOutput,
AMFAddRecordInteractorOutput>

@property (nonatomic, weak) id<AMFAddRecordViewInput> view;
@property (nonatomic, strong) id<AMFAddRecordInteractorInput> interactor;
@property (nonatomic, strong) id<AMFAddRecordRouterInput> router;
@property (nonatomic, weak) id<AMFAddRecordModuleOutput> moduleOutput;

@end
