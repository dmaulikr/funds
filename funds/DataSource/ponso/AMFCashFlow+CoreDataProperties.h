//
//  AMFCashFlow+CoreDataProperties.h
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCashFlow+CoreDataClass.h"
#import "AMFCashProtocol.h"
#import "AMFWallet+CoreDataProperties.h"
#import "AMFCurrency+CoreDataProperties.h"
#import "AMFCategory+CoreDataProperties.h"
#import "AMFPage+CoreDataProperties.h"

NS_ASSUME_NONNULL_BEGIN


@interface AMFCashFlow (CoreDataProperties) <AMFCashProtocol>

+ (NSFetchRequest<AMFCashFlow *> *)fetchRequest;

@property (nonatomic, assign) NSUInteger cash_id;
@property (nonatomic) double amount;
@property (nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSString *descr;
@property (nonatomic) double pos_lat;
@property (nonatomic) double pos_lon;
@property (nonatomic, retain) AMFCashFlow *wallet2wallet; // if we moved money to another wallet
@property (nonatomic, retain) AMFWallet *wallet;
@property (nonatomic, retain) AMFCategory *category;
@property (nonatomic, retain) AMFCurrency *currency;
@property (nonatomic, retain) AMFPage *page;

-(void) updateWith:(id<AMFCashProtocol>)cash;

@end

NS_ASSUME_NONNULL_END
