//
//  AMFCurrencyPlain.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrencyPlain.h"

static NSString *const kName = @"name";
static NSString *const kSymbol = @"symbol";
static NSString *const kRate = @"rate";

@implementation AMFCurrencyPlain

@synthesize name,
symbol,
rate;

- (instancetype)initWithCurrency:(id<AMFCurrencyProtocol>)cur {
    if (self = [super init]) {
        self.name = cur.name;
        self.symbol = cur.symbol;
        self.rate = cur.rate;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Currency Plain name: %@ symbol: %@ rate: %g",
            self.name,
            self.symbol,
            self.rate];
}

#pragma mark - NSCoding protocol

- (instancetype)initWithCoder:(NSCoder *)aCoder {
    if (self = [super init]) {
        self.name = [aCoder decodeObjectForKey:kName];
        self.symbol = [aCoder decodeObjectForKey:kSymbol];
        self.rate = [[aCoder decodeObjectForKey:kRate] doubleValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.symbol forKey:kSymbol];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.rate] forKey:kRate];
}

@end
