//
//  AMFCurrency+CoreDataProperties.m
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCurrency+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>
#import "NSManagedObject+generateID.h"
#import "AMFgenerateID.h"

@implementation AMFCurrency (CoreDataProperties)

+ (NSFetchRequest<AMFCurrency *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFCurrency"];
}

+ (AMFCurrency*) findOrCreateWithPage:(id<AMFCurrencyProtocol>)m andCash:(AMFCashFlow*)cash {
    static AMFgenerateID *_gen = nil;
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", m.name];
    AMFCurrency *mon = [AMFCurrency MR_findFirstWithPredicate:predicate inContext:con];
    if (!mon) {
        mon = [AMFCurrency MR_createEntityInContext:con];
        if (!_gen) {
            _gen = [[AMFgenerateID alloc] initWithID:
                    [NSManagedObject nextID:@"cur_id"
                              forEntityName:@"AMFCurrency"
                                  inContext:con]];
        }
        mon.cur_id = [_gen generateID];
    }
    assert(mon);
    [mon updateWith:m andCash:cash];
    return mon;
}

@dynamic cur_id;
@dynamic name;
@dynamic rate;
@dynamic cash;
@dynamic symbol;

- (void)updateWith:(id<AMFCurrencyProtocol>)m andCash:(AMFCashFlow*)cash {
    self.name = m.name;
    self.rate = m.rate;
    if (![self.cash containsObject:cash])
        [self addCashObject:cash];
}

@end
