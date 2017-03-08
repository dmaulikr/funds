//
//  AMFFlowRouter.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "AMFFlowRouterInput.h"

@interface AMFFlowRouter : NSObject<AMFFlowRouterInput>

@property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
