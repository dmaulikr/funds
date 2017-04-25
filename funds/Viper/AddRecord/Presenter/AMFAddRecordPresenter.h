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

@protocol AMFAddRecordViewInput;
@protocol AMFAddRecordInteractorInput;
@protocol AMFAddRecordRouterInput;

@interface AMFAddRecordPresenter : NSObject <AMFAddRecordModuleInput, AMFAddRecordViewOutput, AMFAddRecordInteractorOutput>

@property (nonatomic, weak) id<AMFAddRecordViewInput> view;
@property (nonatomic, strong) id<AMFAddRecordInteractorInput> interactor;
@property (nonatomic, strong) id<AMFAddRecordRouterInput> router;

@end
