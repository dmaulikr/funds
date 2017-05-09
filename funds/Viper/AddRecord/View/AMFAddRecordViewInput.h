//
//  AMFAddRecordViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFCategoryProtocol.h"
#import "AMFCurrencyProtocol.h"
#import "AMFWalletProtocol.h"

@protocol AMFCashProtocol;

@protocol AMFAddRecordViewInput <NSObject>

/**
 @author Michael Artuerhof

 sets initial state of the view
 */
- (void)setupInitialState;

/**
 * setups additional elements of the view
 */
- (void)setupView;

/**
 * forces the view to update itself
 */
- (void)refreshView;

/// which category was selected
@property (nonatomic, strong) id<AMFCategoryProtocol> selectedCategory;

/// which currency was selected
@property (nonatomic, strong) id<AMFCurrencyProtocol> selectedCurrency;

/// which wallet was selected
@property (nonatomic, strong) id<AMFWalletProtocol> selectedWallet;

/// which wallet (if we want to move cash into it) was selected
@property (nonatomic, strong) id<AMFWalletProtocol> selectedMoveIntoWallet;

/// in edit mode cash to be edited
@property (nonatomic, strong) id<AMFCashProtocol> cash;

@end
