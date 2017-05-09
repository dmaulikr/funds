//
//  AMFAddRecordViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFAddRecordViewOutput <NSObject>

/**
 @author Michael Artuerhof

 tells the presenter that the view is ready for work
 */
- (void)didTriggerViewReadyEvent;

/**
 user wants to change wallet's currency
 */
- (void)changeWalletCurrency;

/**
 user wants to change input's currency
 */
- (void)changeInputCurrency;

/**
 user wants to change category
 */
- (void)changeCatogory;

/**
 user wants to change wallet
 */
- (void)changeWallet;

/**
 * user wants to change wallet where the money will be moved
 */
- (void)changeWalletMoveTo;

/**
 * user doesn't want to move money into another account any more
 */
- (void)nullifyWalletMoveTo;

/**
 * user wants to insert new record and pressed done button
 * @param amount how much to withdraw
 * @param descr record's description
 */
- (void)editOfRecordDoneWithTitle:(NSString*)amount andDescription:(NSString*)descr;

@end
