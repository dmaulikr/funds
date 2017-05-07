//
//  AMFCashFlow+CoreDataProperties.m
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCashFlow+CoreDataProperties.h"

@implementation AMFCashFlow (CoreDataProperties)

+ (NSFetchRequest<AMFCashFlow *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFCashFlow"];
}

@dynamic cash_id;
@dynamic amount;
@dynamic date;
@dynamic descr;
@dynamic pos_lat;
@dynamic pos_lon;
@dynamic wallet;
@dynamic category;
@dynamic currency;
@dynamic page;
@dynamic wallet2wallet;

static NSString *const kDate = @"date";
static NSString *const kAmount = @"amount";
static NSString *const kDescr = @"descript";

-(NSString*)description {
    return [NSString stringWithFormat:@"CASHFLOW: %@ => description: %@, amount: %g",
            self.date,
            self.descr,
            self.amount];
}

-(void)updateWith:(id<AMFCashProtocol>)cash {
    self.amount = cash.amount;
    self.descr = cash.descr;
    self.date = cash.date;
    self.pos_lat = cash.pos_lat;
    self.pos_lon = cash.pos_lon;
    self.wallet = [AMFWallet findOrCreateWithWallet:cash.wallet
                                            andCash:self];
    self.category = [AMFCategory findOrCreateWithCategory:cash.category
                                                  andCash:self];
    self.page = [AMFPage findOrCreateWithPage:cash.page andCash:self];
    self.currency = [AMFCurrency findOrCreateWithPage:cash.currency andCash:self];
}

#pragma mark - NSCoding protocol

- (instancetype)initWithCoder:(NSCoder *)aCoder {
    if (self = [super init]) {
        self.date = [aCoder decodeObjectForKey:kDate];
        NSNumber *am = [aCoder decodeObjectForKey:kAmount];
        self.amount = [am doubleValue];
        self.descr = [aCoder decodeObjectForKey:kDescr];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.date forKey:kDate];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.amount] forKey:kAmount];
    [aCoder encodeObject:self.descr forKey:kDescr];
}

@end
