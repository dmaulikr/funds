//
//  AMFAlertProtocol.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFAlertProtocol <NSObject>

-(void) showErrorWithMessage:(NSString*) message;
-(void) showWarningWithMessage:(NSString*) message;

@end
