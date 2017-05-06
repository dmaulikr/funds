//
//  AMFNameIconSetterRouter.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFNameIconSetterRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFNameIconSetterRouter

#pragma mark - Methods of AMFNameIconSetterRouterInput

- (void)closeMe {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
