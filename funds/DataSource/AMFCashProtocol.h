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

@protocol AMFCashProtocol <NSObject>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSDate *date;
@property (nonatomic, strong) id<AMFWalletProtocol> *wallet;
@property (nonatomic, strong) id<AMFCurrencyProtocol> *currency;
@property (nonatomic, strong) id<AMFCategoryProtocol> *category;

@end
