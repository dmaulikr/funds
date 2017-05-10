//
//  AMFCommonRouter.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCommonRouter.h"
#import "AMFSimpleAlertProtocol.h"

@implementation AMFCommonRouter


- (void)showErrorWithMessage:(NSString *)message {
    UIAlertController *ac = [_alertFactory acErrorWithMessage:message];
    [(id)self.transitionHandler presentViewController:ac animated:YES completion:nil];
}

- (void)showWarningWithMessage:(NSString *)message {
    UIAlertController *ac = [_alertFactory acWarningWithMessage:message];
    [(id)self.transitionHandler presentViewController:ac animated:YES completion:nil];
}

@end
