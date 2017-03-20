//
//  AMFCurrency+CoreDataProperties.h
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCurrency+CoreDataClass.h"
#import "AMFCurrencyProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMFCurrency (CoreDataProperties) <AMFCurrencyProtocol>

+ (NSFetchRequest<AMFCurrency *> *)fetchRequest;
+ (AMFCurrency*) findOrCreateWithPage:(id<AMFCurrencyProtocol>)m
                              andCash:(AMFCashFlow*)cash;

@property (nonatomic, assign) NSUInteger cur_id;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, copy) NSString *symbol;
@property (nonatomic) double rate;
@property (nullable, nonatomic, retain) NSSet<AMFCashFlow *> *cash;

@end

@interface AMFCurrency (CoreDataGeneratedAccessors)

- (void)addCashObject:(AMFCashFlow *)value;
- (void)removeCashObject:(AMFCashFlow *)value;
- (void)addCash:(NSSet<AMFCashFlow *> *)values;
- (void)removeCash:(NSSet<AMFCashFlow *> *)values;

@end

NS_ASSUME_NONNULL_END
