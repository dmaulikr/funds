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

@interface AMFSQLCoreDataHandler()

- (void) saveContext;

@end

@implementation AMFSQLCoreDataHandler

-(void) initStorage {
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"funds"];
    LogDebug(@"Storage 'funds' initialized!");
}

- (void)typhoonDidInject {
    [self initStorage];
}

+(NSUInteger) generateID {
    static NSUInteger identification = 0;
    return identification++;
}

-(AMFCashFlow*) addNoRecurcyWithRecord:(id<AMFCashProtocol>)rec {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date = %@) AND (descr = %@) AND (amount = %g)", rec.date, rec.descr, rec.amount];
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    AMFCashFlow *cash = [AMFCashFlow MR_findFirstWithPredicate:predicate inContext:con];
    if (!cash) {
        cash = [AMFCashFlow MR_createEntityInContext:con];
        cash.cash_id = [AMFSQLCoreDataHandler generateID];
    }
    assert(cash);
    [cash updateWith:rec];
    return cash;
}

-(void) addWithRecord:(id<AMFCashProtocol>)rec {
    AMFCashFlow *first = [self addNoRecurcyWithRecord:rec];
    if (rec.wallet2wallet) {
        AMFCashFlow *second = [self addNoRecurcyWithRecord:rec.wallet2wallet];
        first.wallet2wallet = second;
    }
}

-(void) addRecord:(id<AMFCashProtocol>)rec {
    [self addWithRecord:rec];
    [self saveContext];
}

-(void) addRecords:(NSArray*)ar {
    for (id<AMFCashProtocol> rec in ar)
        [self addWithRecord:rec];
    [self saveContext];
}

-(NSArray*) grabRecordsForPage:(id<AMFPageProtocol>)page {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"ANY page.name == %@",
                              page.name];
    return [AMFCashFlow MR_findAllSortedBy:@"cash_id" ascending:NO withPredicate:predicate];
}

-(NSArray*) grabAllRecords {
    return [AMFCashFlow MR_findAllSortedBy:@"date" ascending:NO];
}

-(NSArray*) grabAllPages {
    return [AMFPage MR_findAllSortedBy:@"page_id" ascending:NO];
}

-(void) removeAll {
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
