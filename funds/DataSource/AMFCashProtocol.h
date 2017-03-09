//
//  AMFCashProtocol.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFWalletProtocol;
@protocol AMFCurrencyProtocol;
@protocol AMFCategoryProtocol;
@protocol AMFPageProtocol;

@protocol AMFCashProtocol <NSObject>

@property (nonatomic, copy) NSString *descr;
@property (nonatomic, copy) NSDate *date;
@property (nonatomic, assign) double amount;
@property (nonatomic, assign) double pos_lon;
@property (nonatomic, assign) double pos_lat;
@property (nonatomic, strong) id<AMFCashProtocol> wallet2wallet;
@property (nonatomic, strong) id<AMFWalletProtocol> wallet;
@property (nonatomic, strong) id<AMFCurrencyProtocol> currency;
@property (nonatomic, strong) id<AMFCategoryProtocol> category;
@property (nonatomic, strong) id<AMFPageProtocol> page;

@end
