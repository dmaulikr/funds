//
//  AMFWalletInteractorOutput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFWalletInteractorOutput <NSObject>

- (void)walletsReceived:(NSArray*)w;

@end
