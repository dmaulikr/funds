//
//  AMFChooseCategoryCell.h
//  funds
//
//  Created by Michael on 03.05.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFSwipeableCell.h"

@protocol AMFChooseCategoryCellDelegate <NSObject>
- (void)editActionForItem:(NSString *)itemText andCell:(AMFSwipeableCell*)cell;
@end

@interface AMFChooseCategoryCell : AMFSwipeableCell

@property (nonatomic, weak) id <AMFChooseCategoryCellDelegate> edit_delegate;

@end
