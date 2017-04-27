//
//  AMFPage+CoreDataProperties.h
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFPage+CoreDataClass.h"
#import "AMFPageProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AMFPage (CoreDataProperties) <AMFPageProtocol, NSCoding>

+ (NSFetchRequest<AMFPage *> *)fetchRequest;
+ (AMFPage*) findOrCreateWithPage:(id<AMFPageProtocol>)page andCash:(AMFCashFlow*)cash;

@property (nonatomic, assign) NSUInteger page_id;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<AMFCashFlow *> *cashflow;

@end

@interface AMFPage (CoreDataGeneratedAccessors)

- (void)addCashflowObject:(AMFCashFlow *)value;
- (void)removeCashflowObject:(AMFCashFlow *)value;
- (void)addCashflow:(NSSet<AMFCashFlow *> *)values;
- (void)removeCashflow:(NSSet<AMFCashFlow *> *)values;

@end

NS_ASSUME_NONNULL_END
