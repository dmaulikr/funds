//
//  AMFSQLCoreDataHandler.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFSQLCoreDataHandler.h"
#import <MagicalRecord/MagicalRecord.h>
#import "AMFCashFlow+CoreDataClass.h"
#import "AMFCashFlow+CoreDataProperties.h"
#import "AMFCurrency+CoreDataProperties.h"
#import "AMFPage+CoreDataProperties.h"
#import "NSManagedObject+generateID.h"
#import "AMFCategoryProtocol.h"
#import "AMFCategoryPlain.h"
#import "AMFWalletPlain.h"
#import "AMFCurrencyPlain.h"
#import "AMFgenerateID.h"

@interface AMFSQLCoreDataHandler() {
    AMFgenerateID *_gen;
}

- (void)saveContext;

@end

@implementation AMFSQLCoreDataHandler

- (AMFCashFlow *)addNoRecurcyWithRecord:(id<AMFCashProtocol>)rec {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date = %@) AND (descr = %@) AND (amount = %g)", rec.date, rec.descr, rec.amount];
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    AMFCashFlow *cash = [AMFCashFlow MR_findFirstWithPredicate:predicate inContext:con];
    if (!cash) {
        cash = [AMFCashFlow MR_createEntityInContext:con];
        if (!_gen) {
            _gen = [[AMFgenerateID alloc] initWithID:
                    [NSManagedObject nextID:@"cash_id"
                              forEntityName:@"AMFCashFlow"
                                  inContext:con]];
        }
        assert(_gen);
        cash.cash_id = [_gen generateID];
    }
    assert(cash);
    [cash updateWith:rec];
    return cash;
}

- (void)addWithRecord:(id<AMFCashProtocol>)rec {
    AMFCashFlow *first = [self addNoRecurcyWithRecord:rec];
    if (rec.wallet2wallet) {
        AMFCashFlow *second = [self addNoRecurcyWithRecord:rec.wallet2wallet];
        first.wallet2wallet = second;
    }
}

- (void)addRecord:(id<AMFCashProtocol>)rec {
    [self addWithRecord:rec];
    [self saveContext];
}

- (void)addRecords:(NSArray *)ar {
    for (id<AMFCashProtocol> rec in ar)
        [self addWithRecord:rec];
    [self saveContext];
}

- (void)addPage:(id<AMFPageProtocol>)page {
    [AMFPage findOrCreateWithPage:page];
}

- (id<AMFCashProtocol>)findCashInStorage:(id<AMFCashProtocol>)rec {
    if (![rec isKindOfClass:[AMFCashFlow class]]) { // only a description of a record: try to find one in the db
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date = %@) AND (category.name == %@) AND (descr = %@) AND (amount = %g)",
                                  rec.date,
                                  rec.category.name,
                                  rec.descr,
                                  rec.amount];
        NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
        AMFCashFlow *cash = [AMFCashFlow MR_findFirstWithPredicate:predicate inContext:con];
        return cash;
    }
    return rec; // already a class in storage
}

- (AMFCashFlow *)restoreAmountOfRecord:(id<AMFCashProtocol>)rec {
    AMFCashFlow *cash = (AMFCashFlow *)[self findCashInStorage:rec];
    if (cash) {
        if (cash.wallet) {
            // restore amount of the wallet
            cash.wallet.amount += -(cash.amount);
        }
        if (cash.category) {
            cash.category.amount += -(cash.amount);
        }
        return cash;
    }
    return nil;
}

- (void)updateRecord:(id<AMFCashProtocol>)rec withAmount:(double)amount
           andWallet:(id<AMFWalletProtocol>)wallet
         andCategory:(id<AMFCategoryProtocol>)category {
    AMFCashFlow *cash = [self restoreAmountOfRecord:rec];
    if (cash) {
        cash.amount = amount;
        cash.wallet = [AMFWallet findOrCreateWithWallet:wallet];
        cash.category = [AMFCategory findOrCreateWithCategory:category];
        [cash updateWith:rec];
    }
}

- (void)removeRecord:(id<AMFCashProtocol>)rec {
    AMFCashFlow *cash = [self restoreAmountOfRecord:rec];
    if (cash) {
        [cash MR_deleteEntity];
    }
}

- (void)updateWallet:(id<AMFWalletProtocol>)wallet withName:(NSString *)name andIcon:(NSString *)icon {
    if (![wallet isKindOfClass:[AMFWallet class]])
        wallet = [AMFWallet findOrCreateWithWallet:wallet];
    wallet.name = name;
    wallet.icon_path = icon;
}

- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString *)name {
    id<AMFPageProtocol> p = [AMFPage findOrCreateWithPage:page];
    p.name = name;
}

- (void)removePage:(id<AMFPageProtocol>)page {
    AMFPage *p = [AMFPage findOrCreateWithPage:page];
    NSUInteger page_id = p.page_id > 0 ? p.page_id - 1 : 0;
    AMFPage *page4attach = nil;
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    while (page_id > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(page_id == %ld)", (long)page_id];
        if ((page4attach = [AMFPage MR_findFirstWithPredicate:predicate inContext:con])) {
            break;
        }
        page_id--;
    }
    if (!page4attach) {
        page.name = @"?";
        page4attach = [AMFPage findOrCreateWithPage:page];
    }
    NSArray *cash = [self grabRecordsForPage:p];
    NSSet *cashSet = [NSSet setWithArray:cash];
    [p removeCashflow:cashSet];
    [page4attach addCashflow:cashSet];
    [p MR_deleteEntity];
}

- (NSArray *)grabRecordsForPage:(id<AMFPageProtocol>)page {
    NSPredicate *predicate;
    if (![page isKindOfClass:[AMFPage class]]) {
        predicate = [NSPredicate predicateWithFormat:@"page.name == %@",
                              page.name];
    }
    else {
        AMFPage *p = (AMFPage*)page;
        predicate = [NSPredicate predicateWithFormat:@"page.page_id == %ld",
                              (long)p.page_id];
    }
    return [AMFCashFlow MR_findAllSortedBy:@"cash_id" ascending:NO withPredicate:predicate];
}

- (NSArray *)grabAllRecords {
    return [AMFCashFlow MR_findAllSortedBy:@"date" ascending:NO];
}

- (NSArray *)grabAllCategories {
    return [AMFCategory MR_findAllSortedBy:@"cat_id" ascending:NO];
}

- (NSArray *)grabAllPages {
    return [AMFPage MR_findAllSortedBy:@"page_id" ascending:NO];
}

- (NSArray *)grabAllCurrencies {
    return [AMFCurrency MR_findAllSortedBy:@"cur_id" ascending:NO];
}

- (id<AMFWalletProtocol>)createWalletWithName:(NSString *)name andIcon:(NSString*)icon {
    AMFWalletPlain *w = [[AMFWalletPlain alloc] init];
    w.name = name;
    w.icon_path = icon;
    return [AMFWallet findOrCreateWithWallet:w];
}

- (NSArray *)grabAllRecordsForWallet:(id<AMFWalletProtocol>)wallet {
    NSPredicate *predicate;
    if (![wallet isKindOfClass:[AMFWallet class]]) {
        predicate = [NSPredicate predicateWithFormat:@"wallet.name == %@",
                     wallet.name];
    }
    else {
        AMFWallet *w = (AMFWallet*)wallet;
        predicate = [NSPredicate predicateWithFormat:@"wallet.wallet_id == %ld",
                     (long)w.wallet_id];
    }
    return [AMFCashFlow MR_findAllSortedBy:@"cash_id" ascending:NO withPredicate:predicate];
}

- (void)removeWallet:(id<AMFWalletProtocol>)wallet {
    AMFWallet *w = [AMFWallet findOrCreateWithWallet:wallet];
    NSUInteger w_id = w.wallet_id > 0 ? w.wallet_id - 1 : 0;
    AMFWallet *w4attach = nil;
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    while (w_id > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(wallet_id == %ld)", (long)w_id];
        if ((w4attach = [AMFWallet MR_findFirstWithPredicate:predicate inContext:con])) {
            break;
        }
        w_id--;
    }
    if (!w4attach) {
        AMFWalletPlain *pw = [[AMFWalletPlain alloc] init];
        pw.name = @"?";
        w4attach = [AMFWallet findOrCreateWithWallet:pw];
    }
    NSArray *cash = [self grabAllRecordsForWallet:w];
    NSSet *cashSet = [NSSet setWithArray:cash];
    [w removeCash:cashSet];
    [w4attach addCash:cashSet];
    w4attach.amount += w.amount;
    [w MR_deleteEntity];
}

- (id<AMFCategoryProtocol>)grabCategoryWithName:(NSString *)name {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@",
                              name];
    return [AMFCategory MR_findFirstWithPredicate:predicate
                                         sortedBy:@"cat_id"
                                        ascending:NO
                                        inContext:[NSManagedObjectContext MR_defaultContext]];
}

- (id<AMFCategoryProtocol>)createCategoryWithName:(NSString *)name
                                          andIcon:(NSString*)icon {
    AMFCategoryPlain *cat = [[AMFCategoryPlain alloc] init];
    cat.name = name;
    cat.icon_path = icon;
    return [AMFCategory findOrCreateWithCategory:cat];
}

- (void)updateCategory:(id<AMFCategoryProtocol>)category
              withName:(NSString *)name
               andIcon:(NSString *)icon {
    if (![category isKindOfClass:[AMFWallet class]])
        category = [AMFCategory findOrCreateWithCategory:category];
    category.name = name;
    category.icon_path = icon;
}

- (id<AMFCurrencyProtocol>)createCurrencyWithName:(NSString *)name {
    AMFCurrencyPlain *cur = [[AMFCurrencyPlain alloc] init];
    cur.name = name;
    cur.symbol = @"";
    cur.rate = 1;
    return [AMFCurrency findOrCreateWithCurrency:cur];
}

- (void)updateCurrency:(id<AMFCurrencyProtocol>)currency
          withCurrency:(id<AMFCurrencyProtocol>)cur {
    if (![currency isKindOfClass:[AMFCurrency class]])
        currency = [AMFCurrency findOrCreateWithCurrency:currency];
    currency.name = cur.name;
    currency.symbol = cur.symbol;
    currency.rate = cur.rate;
}

- (NSArray *)grabAllWallets {
    return [AMFWallet MR_findAllSortedBy:@"wallet_id" ascending:NO];
}

- (void)removeAll {
    for (AMFCashFlow *cash in [AMFCashFlow MR_findAll])
        [cash MR_deleteEntity];
    for (AMFPage *page in [AMFPage MR_findAll])
        [page MR_deleteEntity];
    for (AMFCategory *c in [AMFCategory MR_findAll])
        [c MR_deleteEntity];
    for (AMFWallet *w in [AMFWallet MR_findAll])
        [w MR_deleteEntity];
    for (AMFCurrency *c in [AMFCurrency MR_findAll])
        [c MR_deleteEntity];
    [self saveContext];
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL success, NSError *error) {
        if (success) {
            LogDebug(@"You successfully saved your context.");
        } else if (error) {
            LogDebug(@"Error saving context: %@", error.description);
        }
    }];
}
@end
