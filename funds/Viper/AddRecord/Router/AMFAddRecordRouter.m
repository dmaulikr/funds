//
//  AMFAddRecordRouter.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFAddRecordRouter

#pragma mark - Methods of AMFAddRecordRouterInput

- (void)closeMe {
    [self.transitionHandler closeCurrentModule:YES];
}

@end
