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

-(NSString*) description {
    return [NSString stringWithFormat:@"CASH Plain: %@ => description: %@, amount: %g",
            self.date,
            self.descr,
            self.amount];
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
