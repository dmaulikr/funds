//
//  AMFFlowPresenter.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowPresenter.h"

#import "AMFFlowViewInput.h"
#import "AMFFlowInteractorInput.h"
#import "AMFFlowRouterInput.h"

@implementation AMFFlowPresenter

#pragma mark - Methods AMFFlowModuleInput

- (void)configureModule {
    // configuration of the module which are independent from view
}

#pragma mark - Interface


-(void)setupView {
    
}

-(void)pageClicked {
    
}

-(void)addClicked {
    
}

#pragma mark - State

-(void)didTriggerViewReadyEvent {
    [self.view setupInitialState];
}
@end
