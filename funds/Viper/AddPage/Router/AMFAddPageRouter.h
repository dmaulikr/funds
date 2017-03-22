//
//  AMFAddPageRouter.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface AMFAddPageRouter : NSObject <AMFAddPageRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
