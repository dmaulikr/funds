//
//  AMFWalletViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFWalletViewOutput <NSObject>

/**
 * view is ready to go
 */
- (void)didTriggerViewReadyEvent;

/**
 * a cell with a given number was selected
 */
- (void)cellSelected:(NSUInteger)index;

/**
 * edit wallet please
 */
- (void)editWalletWithIndex:(NSUInteger)index;

/**
 * add a wallet please
 */
- (void)addWallet;

@end
