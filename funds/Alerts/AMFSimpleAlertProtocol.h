//
//  AMFSimpleAlertProtocol.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

@class UIAlertController;

@protocol AMFSimpleAlertProtocol <NSObject>

- (UIAlertController *)acErrorWithMessage:(NSString *)message;
- (UIAlertController *)acWarningWithMessage:(NSString *)message;

@end
