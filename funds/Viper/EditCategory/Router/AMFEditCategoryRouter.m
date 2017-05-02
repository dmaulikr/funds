//
//  AMFEditCategoryRouter.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFEditCategoryRouter

#pragma mark - Methods of AMFEditCategoryRouterInput

- (void)closeMe {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
