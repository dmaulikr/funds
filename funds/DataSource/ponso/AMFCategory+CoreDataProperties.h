//
//  AMFCategory+CoreDataProperties.h
//
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCategory+CoreDataClass.h"
#import "AMFCategoryProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface AMFCategory (CoreDataProperties) <AMFCategoryProtocol>

+ (NSFetchRequest<AMFCategory *> *)fetchRequest;
+ (AMFCategory *)findOrCreateWithCategory:(id<AMFCategoryProtocol>)category;
+ (AMFCategory *)findOrCreateWithCategory:(id<AMFCategoryProtocol>)category
                                  andCash:(AMFCashFlow *_Nonnull)cash;

@property (nonatomic, assign) NSUInteger cat_id;
@property (nullable, nonatomic, copy) NSString *icon_path;
@property (nullable, nonatomic, copy) NSString *name;
@property (nonatomic, assign) double amount;
@property (nullable, nonatomic, retain) NSSet<AMFCashFlow *> *cash;

@end

@interface AMFCategory (CoreDataGeneratedAccessors)

- (void)addCashObject:(AMFCashFlow *)value;
- (void)removeCashObject:(AMFCashFlow *)value;
- (void)addCash:(NSSet<AMFCashFlow *> *)values;
- (void)removeCash:(NSSet<AMFCashFlow *> *)values;

@end

NS_ASSUME_NONNULL_END
