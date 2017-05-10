//
//  AMFChooseCategoryViewController.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryViewController.h"
#import "AMFCategoryProtocol.h"
#import "AMFSwipeableCell.h"
#import "AMFChooseCategoryCell.h"

#import "AMFChooseCategoryViewOutput.h"

static NSString *const chooseCatCellIndentifier = @"chooseCategoryCell";

@interface AMFChooseCategoryViewController () <UITableViewDelegate,
UITableViewDataSource,
AMFChooseCategoryCellDelegate,
AMFSwipeableCellDelegate> {
    BOOL _firstTimeScroll;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFChooseCategoryViewController

@synthesize selectedCategory,
categories;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	_firstTimeScroll = YES;

	[self.output didTriggerViewReadyEvent];
}

- (void)addCategory {
    [self.output addCategory];
}

#pragma mark - Методы AMFChooseCategoryViewInput

- (void)setupInitialState {
    if (!self.navigationItem.rightBarButtonItem) {
        // add new category
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addCategory)];
        self.navigationItem.rightBarButtonItem = right;
    }
}

- (void)refreshContents {
    // somehow tableView wasn't loaded correctly from nib, do it manually
    if (!self.tableView)
        self.tableView = [self.view viewWithTag:555];
    [self.tableView reloadData];
    if (_firstTimeScroll) {
        _firstTimeScroll = NO;
        NSInteger index = [self.categories indexOfObject:self.selectedCategory];
        if (index >= 0 && index < self.categories.count) {
            NSIndexPath *path = [NSIndexPath indexPathForRow:index inSection:0];
            [self.tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionMiddle animated:NO];
        }
    }
}

#pragma mark - Table View source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMFChooseCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:chooseCatCellIndentifier];
    id <AMFCategoryProtocol> category = [self.categories objectAtIndex:indexPath.row];
    if (self.selectedCategory && // selected cell could be nil
        [category.name isEqualToString:self.selectedCategory.name]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    cell.path = indexPath;
    cell.itemText = category.name;
    cell.itemIcon = category.icon_path.length ? category.icon_path : @"help";
    cell.delegate = self;
    cell.edit_delegate = self;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id <AMFCategoryProtocol> category = [self.categories objectAtIndex:indexPath.row];
    [self.output categorySelected:category];
}

#pragma mark - AMFChooseCategoryCellDelegate

- (void)editActionForItem:(NSString *)itemText andCell:(AMFSwipeableCell*)cell {
    id <AMFCategoryProtocol> category = [self.categories objectAtIndex:cell.path.row];
    [cell prepareForReuse]; // close cell
    [self.output editCategory:category];
}

@end
