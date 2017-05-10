//
//  AMFWallet+CoreDataProperties.h
//
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFWallet+CoreDataClass.h"
#import "AMFWalletProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface AMFWallet (CoreDataProperties) <AMFWalletProtocol, NSCoding>

+ (NSFetchRequest<AMFWallet *> *)fetchRequest;
+ (AMFWallet *)findOrCreateWithWallet:(id<AMFWalletProtocol>)wallet;
+ (AMFWallet *)findOrCreateWithWallet:(id<AMFWalletProtocol>)wallet
                              andCash:(AMFCashFlow *_Nonnull)cash;

@property (nonatomic, assign) NSUInteger wallet_id;
@property (nullable, nonatomic, copy) NSString *icon_path;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic, assign) double amount;
@property (nullable, nonatomic, retain) NSSet<AMFCashFlow *> *cash;

@end

@interface AMFWallet (CoreDataGeneratedAccessors)

- (void)addCashObject:(AMFCashFlow *)value;
- (void)removeCashObject:(AMFCashFlow *)value;
- (void)addCash:(NSSet<AMFCashFlow *> *)values;
- (void)removeCash:(NSSet<AMFCashFlow *> *)values;
- (void)updateWith:(id<AMFWalletProtocol>)wallet andCash:(AMFCashFlow *_Nonnull)cash;

@end

NS_ASSUME_NONNULL_END
