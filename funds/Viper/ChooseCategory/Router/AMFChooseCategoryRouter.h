//
//  AMFChooseCategoryRouter.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryRouterInput.h"

@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface AMFChooseCategoryRouter : NSObject <AMFChooseCategoryRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
