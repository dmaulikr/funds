//
//  AMFWalletRouter.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface AMFWalletRouter : NSObject <AMFWalletRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
