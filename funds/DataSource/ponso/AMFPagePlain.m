//
//  AMFPagePlain.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPagePlain.h"
#import "AMFPageProtocol.h"

static NSString *const kName = @"name";

@implementation AMFPagePlain

@synthesize name;

#pragma mark - NSCoding protocol

- (instancetype)initWithCoder:(NSCoder *)aCoder {
    if (self = [super init]) {
        self.name = [aCoder decodeObjectForKey:kName];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:kName];
}

@end
