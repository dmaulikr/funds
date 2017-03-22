//
//  AMFCommonRouter.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCommonRouter.h"

@implementation AMFCommonRouter

-(UIAlertController*) acErrorWithMessage:(NSString*) message {
    return [_alertFactory acErrorWithMessage:message];
}

-(UIAlertController*) acWarningWithMessage:(NSString*) message {
    return [_alertFactory acWarningWithMessage:message];
}

@end
