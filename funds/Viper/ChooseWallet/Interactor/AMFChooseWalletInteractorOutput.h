//
//  AMFChooseWalletInteractorOutput.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFChooseWalletInteractorOutput <NSObject>

- (void)walletsReceived:(NSArray*)w;

@end
