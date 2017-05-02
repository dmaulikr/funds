//
//  AMFSwipeableCell.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AMFSwipeableCellDelegate <NSObject>
@required
- (void)editActionForItem:(NSString *)itemText;

@optional
- (void)cellDidOpen:(UITableViewCell *)cell;
- (void)cellDidClose:(UITableViewCell *)cell;
@end

@interface AMFSwipeableCell : UITableViewCell

@property (nonatomic, weak) id <AMFSwipeableCellDelegate> delegate;
@property (nonatomic, strong) NSString *itemText;

- (void)openCell;

@end
