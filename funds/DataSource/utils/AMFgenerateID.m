//
//  AMFgenerateID.m
//  funds
//
//  Created by Michael on 14.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFgenerateID.h"


@interface AMFgenerateID () {
    NSUInteger _id;
}

@end

@implementation AMFgenerateID

- (instancetype)init {
    return [self initWithID:0];
}

- (instancetype)initWithID:(NSUInteger)idInit {
    self = [super init];
    if (self) {
        _id = idInit;
    }
    return self;
}

- (NSUInteger)generateID {
    return _id++;
}

@end
