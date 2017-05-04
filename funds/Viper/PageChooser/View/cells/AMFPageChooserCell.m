//
//  AMFPageChooserCell.m
//  funds
//
//  Created by Michael Artuerhof on 04/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserCell.h"

@interface AMFPageChooserCell ()

@property (nonatomic, weak) IBOutlet UIButton *button_edit;
@property (nonatomic, weak) IBOutlet UIButton *button_delete;

@end

@implementation AMFPageChooserCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.button_edit setTitle:AMFLocalize(@"Edit") forState:UIControlStateNormal];
    [self.button_delete setTitle:AMFLocalize(@"Delete") forState:UIControlStateNormal];
}

#pragma mark - user actions

- (IBAction)editClicked:(id)sender {
    if (self.edit_delegate)
        [self.edit_delegate editActionForItem:self.itemText andCell:self];
}

- (IBAction)deleteClicked:(id)sender {
     if (self.edit_delegate)
        [self.edit_delegate deleteActionForItem:self.itemText andCell:self];
}

@end
