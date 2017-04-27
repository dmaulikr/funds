//
//  AMFChooseCategoryRouter.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFChooseCategoryRouter

#pragma mark - Methods of AMFChooseCategoryRouterInput

- (void)closeMe {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
