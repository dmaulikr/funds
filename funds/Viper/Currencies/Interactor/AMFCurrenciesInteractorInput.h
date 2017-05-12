//
//  AMFCurrenciesInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFCurrencyProtocol.h"

@protocol AMFCurrenciesInteractorInput <NSObject>

/**
 * ask for available currencies in storage
 */
- (void)receiveAllCurrencies;


/**
 * user wants change wallet's name and icon
 */
- (void)changeCurrency:(id<AMFCurrencyProtocol>)currency withSymbol:(NSString*)name;

@end
