//
//  AMFChooseCategoryCell.m
//  funds
//
//  Created by Michael on 03.05.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryCell.h"

@interface AMFChooseCategoryCell ()

@property (nonatomic, weak) IBOutlet UIButton *button_edit;

@end

@implementation AMFChooseCategoryCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.button_edit setTitle:AMFLocalize(@"Edit") forState:UIControlStateNormal];
}

#pragma mark - user actions

- (IBAction)editClicked:(id)sender {
    if (self.edit_delegate)
        [self.edit_delegate editActionForItem:self.itemText andCell:self];
}

@end
