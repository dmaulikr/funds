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
#import "AMFAddRecordModuleInput.h"
#import "AMFAddRecordModuleOutput.h"
#import "AMFSimpleAlertProtocol.h"

@implementation AMFFlowRouter

-(void) showPageChooserWithPageSelected:(id<AMFPageProtocol>)page andOutput:(id<AMFPageChooserModuleOutput>) output {
    [[self.transitionHandler openModuleUsingSegue:kSegueChoosePage] thenChainUsingBlock:^id<AMFPageChooserModuleOutput>(id<AMFPageChooserModuleInput> moduleInput) {
        [moduleInput configureModuleWithPageSelected:page];
        return output;
    }];
}

-(void) showAddRecordWithOutput:(id<AMFAddRecordModuleOutput>)output {
    [[self.transitionHandler openModuleUsingSegue:kSegueAddRecord] thenChainUsingBlock:^id<AMFAddRecordModuleOutput>(id<AMFAddRecordModuleInput> moduleInput) {
        [moduleInput configureModule];
        return output;
    }];
}

-(void) showErrorWithMessage:(NSString*) message {
    UIAlertController *ac = [super acErrorWithMessage:message];
    [(id)self.transitionHandler presentViewController:ac animated:YES completion:nil];
}

-(void) showWarningWithMessage:(NSString*) message {
    UIAlertController *ac = [super acWarningWithMessage:message];
    [(id)self.transitionHandler presentViewController:ac animated:YES completion:nil];
}
@end
