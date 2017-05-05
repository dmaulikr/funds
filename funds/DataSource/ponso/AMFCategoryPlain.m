//
//  AMFCategoryPlain.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCategoryPlain.h"

static NSString *const kName = @"name";
static NSString *const kIcon = @"icon";
static NSString *const kAmount = @"amount";

@implementation AMFCategoryPlain

@synthesize name,
icon_path,
amount;

- (NSString*)description {
    return [NSString stringWithFormat:@"Category Plain name: %@, icon_path: %@, amount: %g",
            self.name,
            self.icon_path,
            self.amount];
}

#pragma mark - NSCoding protocol

- (instancetype)initWithCoder:(NSCoder *)aCoder {
    if (self = [super init]) {
        self.name = [aCoder decodeObjectForKey:kName];
        self.icon_path = [aCoder decodeObjectForKey:kIcon];
        self.amount = [[aCoder decodeObjectForKey:kAmount] doubleValue];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kName];
    [aCoder encodeObject:self.icon_path forKey:kIcon];
    [aCoder encodeObject:[NSNumber numberWithDouble:self.amount] forKey:kAmount];
}

@end
