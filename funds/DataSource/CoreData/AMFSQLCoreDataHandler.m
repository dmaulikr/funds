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

-(void) addNoRecurcyWithRecord:(id<AMFCashProtocol>)rec {
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(date = %@) AND (descr = %@)", rec.date, rec.descr];
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    AMFCashFlow *cash = [AMFCashFlow MR_findFirstWithPredicate:predicate inContext:con];
    if (!cash)
        cash = [AMFCashFlow MR_createEntityInContext:con];
    assert(cash);
    [cash updateWith:rec];
}

-(void) addWithRecord:(id<AMFCashProtocol>)rec {
    [self addNoRecurcyWithRecord:rec];
    if (rec.wallet2wallet)
        [self addNoRecurcyWithRecord:rec.wallet2wallet];
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
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    return [AMFCashFlow MR_findAllWithPredicate:predicate inContext:con];
}

-(NSArray*) grabAllRecords {
    return [AMFCashFlow MR_findAll];
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
