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

@implementation AMFWallet (CoreDataProperties)

+ (NSFetchRequest<AMFWallet *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFWallet"];
}

+(NSUInteger) generateID {
    static NSUInteger identification = 0;
    return identification++;
}

+ (AMFWallet*) findOrCreateWithWallet:(id<AMFWalletProtocol>)wallet andCash:(AMFCashFlow*)cash {
    NSManagedObjectContext *con = [NSManagedObjectContext MR_defaultContext];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(name = %@) AND (icon_path = %@)", wallet.name, wallet.icon_path];
    AMFWallet *w = [AMFWallet MR_findFirstWithPredicate:predicate inContext:con];
    if (!w) {
        w = [AMFWallet MR_createEntityInContext:con];
        w.wallet_id = [AMFWallet generateID];
    }
    [w updateWith:wallet andCash:cash];
    return w;
}

@dynamic wallet_id;
@dynamic icon_path;
@dynamic name;
@dynamic cash;

- (void)updateWith:(id<AMFWalletProtocol>)wallet andCash:(AMFCashFlow*)cash {
    self.name = wallet.name;
    self.icon_path = wallet.icon_path;
    if (![self.cash containsObject:cash])
        [self addCashObject:cash];
}

@end
