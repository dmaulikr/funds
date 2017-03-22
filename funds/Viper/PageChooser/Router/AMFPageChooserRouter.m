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
#import "AMFPageChooserModuleOutput.h"
#import "AMFAddPageModuleInput.h"
#import "AMFAddPageModuleOutput.h"

@implementation AMFPageChooserRouter

#pragma mark - Методы AMFPageChooserRouterInput

-(void) closeDialog {
    [self.transitionHandler closeCurrentModule:YES];
}

-(void) openAddPageWithOutput:(id<AMFAddPageModuleOutput>)output {
    [[self.transitionHandler openModuleUsingSegue:kSegueAddPage] thenChainUsingBlock:^id<AMFAddPageModuleOutput>(id<AMFAddPageModuleInput> moduleInput) {
        [moduleInput configureModule];
        return output;
    }];
}

@end
