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

@protocol AMFStorageHandlerProtocol <NSObject>

- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString*)name;
- (void)addPage:(id<AMFPageProtocol>)page;
- (void)removePage:(id<AMFPageProtocol>)page;
- (void)addRecord:(id<AMFCashProtocol>)rec;
- (void)removeRecord:(id<AMFCashProtocol>)rec;
- (void)addRecords:(NSArray*)ar;
- (NSArray*)grabRecordsForPage:(id<AMFPageProtocol>)page;
- (NSArray*)grabAllPages;
- (NSArray*)grabAllCategories;
- (NSArray*)grabAllCurrencies;
- (id<AMFCategoryProtocol>)grabCategoryWithName:(NSString*)name;
- (void)removeAll;

@end
