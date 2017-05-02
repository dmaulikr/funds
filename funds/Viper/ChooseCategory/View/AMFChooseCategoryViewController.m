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

#import "AMFChooseCategoryViewOutput.h"

static NSString *const chooseCatCellIndentifier = @"chooseCategoryCell";

@interface AMFChooseCategoryViewController () <UITableViewDelegate, UITableViewDataSource, AMFSwipeableCellDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFChooseCategoryViewController

@synthesize selectedCategory,
categories;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы AMFChooseCategoryViewInput

- (void)setupInitialState {
	// setup anything needed for view for its functioning
}

- (void)refreshContents {
    [self.tableView reloadData];
}

#pragma mark - Table View source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    AMFSwipeableCell *cell = [tableView dequeueReusableCellWithIdentifier:chooseCatCellIndentifier];
    id <AMFCategoryProtocol> category = [self.categories objectAtIndex:indexPath.row];
    if (self.selectedCategory && // selected cell could be nil
        [category.name isEqualToString:self.selectedCategory.name]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    cell.path = indexPath;
    cell.itemText = category.name;
    cell.delegate = self;
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

#pragma mark - AMFSwipeableCellDelegate

- (void)editActionForItem:(NSString *)itemText andCell:(AMFSwipeableCell*)cell {
    id <AMFCategoryProtocol> category = [self.categories objectAtIndex:cell.path.row];
    [cell prepareForReuse]; // close cell
    [self.output editCategory:category];
}

@end
