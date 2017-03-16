//
//  AMFFlowPresenter.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFFlowViewOutput.h"
#import "AMFFlowModuleInput.h"
#import "AMFFlowInteractorOutput.h"
#import "AMFPageChooserModuleOutput.h"
#import "AMFAddRecordModuleOutput.h"

@protocol AMFFlowViewInput;
@protocol AMFFlowInteractorInput;
@protocol AMFFlowRouterInput;

@interface AMFFlowPresenter : NSObject<AMFFlowModuleInput,
AMFFlowViewOutput,
AMFFlowInteractorOutput,
AMFAddRecordModuleOutput,
AMFPageChooserModuleOutput>

@property (nonatomic, weak) id<AMFFlowViewInput> view;
@property (nonatomic, strong) id<AMFFlowInteractorInput> interactor;
@property (nonatomic, strong) id<AMFFlowRouterInput> router;

@end
