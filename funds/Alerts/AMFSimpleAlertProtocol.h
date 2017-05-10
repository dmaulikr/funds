//
//  AMFSimpleAlertProtocol.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

@class UIAlertController;
@class UIAlertAction;

@protocol AMFSimpleAlertProtocol <NSObject>

- (UIAlertController *_Nonnull)acErrorWithMessage:(NSString *_Nonnull)message;
- (UIAlertController *_Nonnull)acWarningWithMessage:(NSString *_Nonnull)message;
- (UIAlertController *_Nonnull)acAlternativeDialogWithMessage:(NSString *_Nonnull)message
                                            andAction:(void(^_Nonnull)(UIAlertAction *_Nonnull action))yesHandler;

@end
