//
//  AMFPlainBudgetData.h
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMFPlainBudgetData : NSObject

@property (nonatomic, strong) NSString *descr;
@property (nonatomic, strong) NSString *category;
@property (nonatomic, strong) NSString *wallet;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) NSString *page;
@property (nonatomic, strong) NSString *currency;
@property (nonatomic, assign) double amount;
@property (nonatomic, strong) NSString *toWallet;
@property (nonatomic, strong) NSString *toWalletCurrency;
@property (nonatomic, assign) double toWalletAmount;

@end
