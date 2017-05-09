//
//  AMFWallet+CoreDataProperties.m
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFWallet+CoreDataProperties.h"
#import <MagicalRecord/MagicalRecord.h>
#import "NSManagedObject+generateID.h"
#import "AMFgenerateID.h"
#import "AMFCashFlow+CoreDataProperties.h"

static NSString *const kName = @"name";
static NSString *const kIcon = @"icon";

@implementation AMFWallet (CoreDataProperties)

- (NSString*)description {
    return [NSString stringWithFormat:@"AMFWallet name: %@, icon_path: %@, amount: %g",
            self.name,
            self.icon_path,
            self.amount];
}

+ (NSFetchRequest<AMFWallet *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFWallet"];
}

+ (AMFWallet*)findOrCreateWithWallet:(id<AMFWalletProtocol>)wallet {
    static AMFgenerateID *_gen = nil;
    if ([wallet isKindOfClass:[AMFWallet class]]) // it's already AMFWallet
        return (AMFWallet*)wallet;
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name = %@) AND (icon_path = %@)",
                              wallet.name, wallet.icon_path];
    AMFWallet *w = [AMFWallet MR_findFirstWithPredicate:predicate inContext:con];
    if (!w) {
        w = [AMFWallet MR_createEntityInContext:con];
        if (!_gen) {
            _gen = [[AMFgenerateID alloc] initWithID:
                    [NSManagedObject nextID:@"wallet_id"
                              forEntityName:@"AMFWallet"
                                  inContext:con]];
        }
        w.wallet_id = [_gen generateID];
        w.amount = 0;
    }
    return w;
}

+ (AMFWallet*)findOrCreateWithWallet:(id<AMFWalletProtocol>)wallet andCash:(AMFCashFlow*)cash {
    AMFWallet *w = [self findOrCreateWithWallet:wallet];
    [w updateWith:wallet andCash:cash];
    return w;
}

@dynamic wallet_id;
@dynamic icon_path;
@dynamic name;
@dynamic cash;
@dynamic amount;

- (void)updateWith:(id<AMFWalletProtocol>)wallet andCash:(AMFCashFlow*)cash {
    self.name = wallet.name;
    self.icon_path = wallet.icon_path;
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
    return [AMFWallet MR_findFirstWithPredicate:predicate inContext:con];
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.icon_path forKey:kIcon];
}

@end
