//
//  AMFBalanceItem.m
//  funds
//
//  Created by Michael on 08.05.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceItem.h"
#import "AMFCategoryProtocol.h"
#import "AMFPageProtocol.h"

@interface AMFBalanceItem () {
    AMFBalanceItemType _type;
}

@end

@implementation AMFBalanceItem

- (instancetype)initWithType:(AMFBalanceItemType)type {
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

- (AMFBalanceItemType)type {
    return _type;
}

@end
