//
//  AMFSwipeableCell.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AMFSwipeableCell;

@protocol AMFSwipeableCellDelegate <NSObject>
@required
- (void)editActionForItem:(NSString *)itemText andCell:(AMFSwipeableCell*)cell;

@optional
- (void)cellDidOpen:(UITableViewCell *)cell;
- (void)cellDidClose:(UITableViewCell *)cell;
@end

@interface AMFSwipeableCell : UITableViewCell

@property (nonatomic, weak) id <AMFSwipeableCellDelegate> delegate;
@property (nonatomic, strong) NSString *itemText;
@property (nonatomic, strong) NSString *itemIcon;
@property (nonatomic, strong) NSIndexPath *path;

- (void)openCell;

@end
