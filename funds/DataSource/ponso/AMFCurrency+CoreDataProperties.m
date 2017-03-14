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

@implementation AMFCurrency (CoreDataProperties)

+ (NSFetchRequest<AMFCurrency *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFCurrency"];
}

+(NSUInteger) generateID {
    static NSUInteger identification = 0;
    return identification++;
}

+ (AMFCurrency*) findOrCreateWithPage:(id<AMFCurrencyProtocol>)m andCash:(AMFCashFlow*)cash {
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", m.name];
    AMFCurrency *mon = [AMFCurrency MR_findFirstWithPredicate:predicate inContext:con];
    if (!mon) {
        mon = [AMFCurrency MR_createEntityInContext:con];
        mon.cur_id = [AMFCurrency generateID];
    }
    assert(mon);
    [mon updateWith:m andCash:cash];
    return mon;
}

@dynamic cur_id;
@dynamic name;
@dynamic rate;
@dynamic cash;

- (void)updateWith:(id<AMFCurrencyProtocol>)m andCash:(AMFCashFlow*)cash {
    self.name = m.name;
    self.rate = m.rate;
    if (![self.cash containsObject:cash])
        [self addCashObject:cash];
}

@end
