//
//  AMFChooseWalletViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFChooseWalletViewOutput <NSObject>

/**
 @author Michael Artuerhof

 tells the presenter that the view is ready for work
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
