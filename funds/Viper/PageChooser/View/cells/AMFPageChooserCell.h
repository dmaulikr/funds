//
//  AMFPageChooserCell.h
//  funds
//
//  Created by Michael Artuerhof on 04/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFSwipeableCell.h"

@protocol AMFPageChooserCellDelegate <NSObject>
- (void)editActionForItem:(NSString *)itemText andCell:(AMFSwipeableCell*)cell;
- (void)deleteActionForItem:(NSString *)itemText andCell:(AMFSwipeableCell*)cell;
@end

@interface AMFPageChooserCell : AMFSwipeableCell

@property (nonatomic, weak) id <AMFPageChooserCellDelegate> edit_delegate;

@end
