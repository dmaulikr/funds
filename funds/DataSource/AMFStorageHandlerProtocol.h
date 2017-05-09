//
//  AMFStorageHandlerProtocol.h
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFCashProtocol;
@protocol AMFPageProtocol;
@protocol AMFCategoryProtocol;
@protocol AMFWalletProtocol;

@protocol AMFStorageHandlerProtocol <NSObject>

- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString*)name;
- (void)addPage:(id<AMFPageProtocol>)page;
- (void)removePage:(id<AMFPageProtocol>)page;
- (void)addRecord:(id<AMFCashProtocol>)rec;
- (id<AMFCashProtocol>)findCashInStorage:(id<AMFCashProtocol>)rec;
- (void)updateRecord:(id<AMFCashProtocol>)rec withAmount:(double)amount;
- (void)removeRecord:(id<AMFCashProtocol>)rec;
- (void)updateWallet:(id<AMFWalletProtocol>)wallet withName:(NSString*)name andIcon:(NSString*)icon;
- (void)addRecords:(NSArray*)ar;
- (NSArray*)grabRecordsForPage:(id<AMFPageProtocol>)page;
- (NSArray*)grabAllRecords;
- (NSArray*)grabAllPages;
- (NSArray*)grabAllCategories;
- (NSArray*)grabAllCurrencies;
- (NSArray*)grabAllWallets;
- (id<AMFCategoryProtocol>)grabCategoryWithName:(NSString*)name;
- (void)updateCategory:(id<AMFCategoryProtocol>)category withName:(NSString*)name andIcon:(NSString*)icon;
- (void)removeAll;

@end
