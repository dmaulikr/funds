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
#import "NSManagedObject+generateID.h"
#import "AMFCategoryProtocol.h"
#import "AMFgenerateID.h"

@interface AMFSQLCoreDataHandler() {
    AMFgenerateID *_gen;
}

- (void)saveContext;

@end

@implementation AMFSQLCoreDataHandler

- (void)initStorage {
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"funds"];
    LogDebug(@"Storage 'funds' initialized!");
}

- (void)typhoonDidInject {
    [self initStorage];
}

- (AMFCashFlow*)addNoRecurcyWithRecord:(id<AMFCashProtocol>)rec {
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

- (void)addRecords:(NSArray*)ar {
    for (id<AMFCashProtocol> rec in ar)
        [self addWithRecord:rec];
    [self saveContext];
}

- (void)addPage:(id<AMFPageProtocol>)page {
    [AMFPage findOrCreateWithPage:page];
}

- (void)removeRecord:(id<AMFCashProtocol>)rec {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date = %@) AND (descr = %@) AND (amount = %g)", rec.date, rec.descr, rec.amount];
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    AMFCashFlow *cash = [AMFCashFlow MR_findFirstWithPredicate:predicate inContext:con];
    if (cash) {
        [cash MR_deleteEntity];
    }
}

- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString*)name {
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

- (NSArray*)grabRecordsForPage:(id<AMFPageProtocol>)page {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"page.name == %@",
                              page.name];
    return [AMFCashFlow MR_findAllSortedBy:@"cash_id" ascending:NO withPredicate:predicate];
}

- (NSArray*)grabAllRecords {
    return [AMFCashFlow MR_findAllSortedBy:@"date" ascending:NO];
}

- (NSArray*)grabAllCategories {
    return [AMFCategory MR_findAllSortedBy:@"cat_id" ascending:NO];
}

- (NSArray*)grabAllPages {
    return [AMFPage MR_findAllSortedBy:@"page_id" ascending:NO];
}

- (NSArray*)grabAllCurrencies {
    return [AMFCurrency MR_findAllSortedBy:@"cur_id" ascending:NO];
}

- (id<AMFCategoryProtocol>)grabCategoryWithName:(NSString*)name {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@",
                              name];
    return [AMFCategory MR_findFirstWithPredicate:predicate
                                         sortedBy:@"cat_id"
                                        ascending:NO
                                        inContext:[NSManagedObjectContext MR_defaultContext]];
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
