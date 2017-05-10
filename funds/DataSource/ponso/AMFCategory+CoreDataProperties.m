//
//  AMFCategory+CoreDataProperties.m
//
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCategory+CoreDataProperties.h"
#import "AMFCashFlow+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>
#import "NSManagedObject+generateID.h"
#import "AMFgenerateID.h"

static NSString *const kName = @"name";
static NSString *const kIcon = @"icon";

@implementation AMFCategory (CoreDataProperties)

- (NSString *)description {
    return [NSString stringWithFormat:@"AMFCategory name: %@, icon_path: %@, amount: %g",
            self.name,
            self.icon_path,
            self.amount];
}

+ (NSFetchRequest<AMFCategory *> *)fetchRequest {
    return [[NSFetchRequest alloc] initWithEntityName:@"AMFCategory"];
}

+ (AMFCategory *)findOrCreateWithCategory:(id<AMFCategoryProtocol>)category {
    static AMFgenerateID *_gen = nil;
    if ([category isKindOfClass:[AMFCategory class]]) // it's already AMFCategory
        return (AMFCategory *)category;
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name = %@) AND (icon_path = %@)", category.name, category.icon_path];
    AMFCategory *c = [AMFCategory MR_findFirstWithPredicate:predicate inContext:con];
    if (!c) {
        c = [AMFCategory MR_createEntityInContext:con];
        if (!_gen) {
            _gen = [[AMFgenerateID alloc] initWithID:
                    [NSManagedObject nextID:@"cat_id"
                              forEntityName:@"AMFCategory"
                                  inContext:con]];
        }
        c.cat_id = [_gen generateID];
        c.amount = 0;
    }
    [c updateWith:category];
    return c;
}

+ (AMFCategory *)findOrCreateWithCategory:(id<AMFCategoryProtocol>)category
                                  andCash:(AMFCashFlow *)cash {
    AMFCategory *c = [self findOrCreateWithCategory:category];
    [c updateWith:category andCash:cash];
    return c;
}

@dynamic cat_id;
@dynamic icon_path;
@dynamic name;
@dynamic cash;
@dynamic amount;

- (void)updateWith:(id<AMFCategoryProtocol>)category {
    self.name = category.name;
    self.icon_path = category.icon_path;
}

- (void)updateWith:(id<AMFCategoryProtocol>)category andCash:(AMFCashFlow *)cash {
    self.amount += cash.amount;
    if (![self.cash containsObject:cash])
        [self addCashObject:cash];
}

#pragma mark - NSCoding protocol

- (instancetype)initWithCoder:(NSCoder *)aCoder {
    NSString *name = [aCoder decodeObjectForKey:kName];
    NSString *icon_path = [aCoder decodeObjectForKey:kIcon];
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name = %@) AND (icon_path = %@)", name, icon_path];
    return [AMFCategory MR_findFirstWithPredicate:predicate inContext:con];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.icon_path forKey:kIcon];
}

@end
