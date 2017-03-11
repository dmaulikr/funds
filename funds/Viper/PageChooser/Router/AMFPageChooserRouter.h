//
//  AMFPageChooserRouter.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserRouterInput.h"


@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface AMFPageChooserRouter : NSObject <AMFPageChooserRouterInput>

@property (nonatomic, weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;

@end
