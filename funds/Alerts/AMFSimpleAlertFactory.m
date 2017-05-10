//
//  LoginAlertFactory.m
//  iMemor
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFSimpleAlertFactory.h"
#import <UIKit/UIKit.h>

@implementation AMFSimpleAlertFactory


- (UIAlertController *)acErrorWithMessage:(NSString *)message {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:AMFLocalize(@"ERROR")
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [ac addAction:defaultAction];
    return ac;
}

- (UIAlertController *)acWarningWithMessage:(NSString *)message {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:AMFLocalize(@"WARNING")
                                                                message:message
                                                         preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    [ac addAction:defaultAction];
    return ac;
}

@end
