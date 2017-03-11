//
//  AMFFlowRouter.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowRouter.h"
#import "GlobalConstants.h"
#import "AMFPageChooserModuleInput.h"
#import "AMFPageChooserModuleOutput.h"

@implementation AMFFlowRouter

-(void) showPageChooserWithPageSelected:(id<AMFPageProtocol>)page andOutput:(id<AMFPageChooserModuleOutput>) output {
    [[self.transitionHandler openModuleUsingSegue:kSegueChoosePage] thenChainUsingBlock:^id<AMFPageChooserModuleOutput>(id<AMFPageChooserModuleInput> moduleInput) {
        [moduleInput configureModuleWithPageSelected:page];
        return output;
    }];
}
@end
