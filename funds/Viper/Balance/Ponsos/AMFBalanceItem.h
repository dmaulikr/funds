//
//  AMFBalanceItem.h
//  funds
//
//  Created by Michael on 08.05.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCategoryProtocol;
@protocol AMFPageProtocol;

typedef NS_ENUM(NSInteger, AMFBalanceItemType) {
    AMFBalanceItemTypeCategory = 0,
    AMFBalanceItemTypeTotalAdditions,
    AMFBalanceItemTypeTotalLoses,
};

/**
 * combines balance-report elements which should be shown to a user
 */
@interface AMFBalanceItem : NSObject

- (instancetype)initWithType:(AMFBalanceItemType)type;

/**
 * item's type
 */
- (AMFBalanceItemType)type;

/**
 * if it's a category report then it should contain category
 */
@property(nonatomic, strong) id<AMFCategoryProtocol> category;

/**
 * contains to which page the balance element belong, nil if it's a total report
 */
@property(nonatomic, strong) id<AMFPageProtocol> page;

/**
 * amount of money spent on item (could be positive or negative)
 */
@property(nonatomic, assign) double amount;

@end
