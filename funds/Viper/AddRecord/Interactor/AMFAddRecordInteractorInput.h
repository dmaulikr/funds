//
//  AMFAddRecordInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCurrencyProtocol;
@protocol AMFCategoryProtocol;
@protocol AMFWalletProtocol;

@protocol AMFAddRecordInteractorInput <NSObject>

/**
 * adds a record to money flow
 * @param amount of the withdrawal of money
 * @param descr - description of the withdrawal of money
 */
- (void)addRecordWithAmount:(double)amount andDescription:(NSString*)descr;

/**
 * user changed the category
 * @param category of the withdrawal of money
 */
- (void)selectedCategory:(id<AMFCategoryProtocol>)category;

/**
 * user changed the current wallet
 * @param wallet from where user wants to take\put money
 */
- (void)selectedWallet:(id<AMFWalletProtocol>)wallet;

/**
 * withdraw wallet (if user wants to move money from one account to another)
 * @param wallet from where user wants to take money
 */
- (void)withdrawalWallet:(id<AMFWalletProtocol>)wallet;


- (id<AMFCategoryProtocol>)currentCategory;

/**
 * returns next available currency
 */
- (id<AMFCurrencyProtocol>)nextCurrency;

/**
 * current (saved one) currency
 */
- (id<AMFCurrencyProtocol>)currentCurrency;

@end
