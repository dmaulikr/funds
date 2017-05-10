//
//  AMFCashPlain.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCashPlain.h"

@implementation AMFCashPlain

@synthesize descr,
date,
amount,
pos_lon,
pos_lat,
wallet2wallet,
wallet,
currency,
category,
page;

static NSString *const kDate = @"date";
static NSString *const kAmount = @"amount";
static NSString *const kDescr = @"descript";

- (NSString *)description {
    return [NSString stringWithFormat:@"CASH Plain: %@ => description: %@, amount: %g",
            self.date,
            self.descr,
            self.amount];
}

- (instancetype)initWithCash:(id<AMFCashProtocol>)cash {
    if (self = [super init]) {
        self.amount = cash.amount;
        self.descr = cash.descr;
        self.pos_lat = cash.pos_lat;
        self.pos_lon = cash.pos_lon;
        self.date = cash.date;
        self.page = cash.page;
        self.wallet = cash.wallet;
        self.category = cash.category;
        self.currency = cash.currency;
    }
    return self;
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
