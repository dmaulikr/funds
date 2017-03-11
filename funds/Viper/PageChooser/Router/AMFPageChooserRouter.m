//
//  AMFPageChooserRouter.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserRouter.h"

#import <ViperMcFlurry/ViperMcFlurry.h>
#import "GlobalConstants.h"
#import "AMFPageChooserModuleInput.h"

@implementation AMFPageChooserRouter

#pragma mark - Методы AMFPageChooserRouterInput

-(void) closeDialog {
    [self.transitionHandler closeCurrentModule:YES];
}

-(void) showWithPageSelected:(id<AMFPageProtocol>)page {
    [[self.transitionHandler openModuleUsingSegue:kSeagueChoosePage] thenChainUsingBlock:^id<RamblerViperModuleOutput>(id<AMFPageChooserModuleInput> moduleInput) {
        [moduleInput configureModuleWithPageSelected:page];
        return nil;
    }];
}

@end
