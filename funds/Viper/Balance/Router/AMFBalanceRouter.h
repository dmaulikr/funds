//
//  AMFBalanceRouter.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface AMFBalanceRouter : NSObject <AMFBalanceRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
