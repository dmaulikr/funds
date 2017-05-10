//
//  AMFAlertProtocol.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

@class UIAlertAction;

@protocol AMFAlertProtocol <NSObject>

- (void)showErrorWithMessage:(NSString *_Nonnull)message;
- (void)showWarningWithMessage:(NSString *_Nonnull)message;
- (void)showAlternativeDialogWithMessage:(NSString *_Nonnull)message
                               andAction:(void(^_Nonnull)(UIAlertAction *_Nonnull action))yesHandler;

@end
