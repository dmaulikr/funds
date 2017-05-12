//
//  AMFCurrenciesInteractorOutput.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCurrenciesInteractorOutput <NSObject>

- (void)currenciesReceived:(NSArray*)c;

@end
