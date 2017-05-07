//
//  AMFWalletRouterInput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFAlertProtocol.h"

@protocol AMFNameIconSetterModuleOutput;

@protocol AMFWalletRouterInput <AMFAlertProtocol>

- (void)showNameIconSetterWithName:(NSString*)name
                           andIcon:(NSString*)icon
                         andOutput:(id<AMFNameIconSetterModuleOutput>) output;

@end
