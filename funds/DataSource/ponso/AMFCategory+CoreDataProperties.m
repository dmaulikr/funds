//
//  AMFCategory+CoreDataProperties.m
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCategory+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation AMFCategory (CoreDataProperties)

+ (NSFetchRequest<AMFCategory *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFCategory"];
}

+ (AMFCategory*) findOrCreateWithCategory:(id<AMFCategoryProtocol>)category
                                andCash:(AMFCashFlow *)cash {
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name = %@) AND (icon_path = %@)", category.name, category.icon_path];
    AMFCategory *c = [AMFCategory MR_findFirstWithPredicate:predicate inContext:con];
    if (!c) {
        c = [AMFCategory MR_createEntityInContext:con];
        [c updateWith:category andCash:cash];
    }
    return c;
}

@dynamic icon_path;
@dynamic name;
@dynamic cash;

- (void)updateWith:(id<AMFCategoryProtocol>)category andCash:(AMFCashFlow*)cash {
    self.name = category.name;
    self.icon_path = category.icon_path;
    if (![self.cash containsObject:cash])
        [self addCashObject:cash];
}

@end
