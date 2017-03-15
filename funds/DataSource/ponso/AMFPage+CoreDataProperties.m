//
//  AMFPage+CoreDataProperties.m
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFPage+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>
#import "NSManagedObject+generateID.h"
#import "AMFgenerateID.h"

@implementation AMFPage (CoreDataProperties)

+ (NSFetchRequest<AMFPage *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFPage"];
}

+ (AMFPage*) findOrCreateWithPage:(id<AMFPageProtocol>)page andCash:(AMFCashFlow*)cash {
    static AMFgenerateID *_gen = nil;
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", page.name];
    AMFPage *p = [AMFPage MR_findFirstWithPredicate:predicate inContext:con];
    if (!p) {
        p = [AMFPage MR_createEntityInContext:con];
        if (!_gen) {
            _gen = [[AMFgenerateID alloc] initWithID:
                    [NSManagedObject nextID:@"page_id"
                              forEntityName:@"AMFPage"
                                  inContext:con]];
        }
        p.page_id = [_gen generateID];
    }
    [p updateWith:page andCash:cash];
    return p;
}

@dynamic page_id;
@dynamic name;
@dynamic cashflow;

- (void)updateWith:(id<AMFPageProtocol>)page andCash:(AMFCashFlow*)cash {
    self.name = page.name;
    if (![self.cashflow containsObject:cash])
        [self addCashflowObject:cash];
}

@end
