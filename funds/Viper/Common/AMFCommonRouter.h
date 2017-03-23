//
//  AMFCommonRouter.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "AMFAlertProtocol.h"

@protocol AMFSimpleAlertProtocol;
@protocol RamblerViperModuleTransitionHandlerProtocol;

@interface AMFCommonRouter : NSObject<AMFAlertProtocol>

@property (nonatomic,weak) id<RamblerViperModuleTransitionHandlerProtocol> transitionHandler;
@property (nonatomic, strong) id<AMFSimpleAlertProtocol> alertFactory;

@end
