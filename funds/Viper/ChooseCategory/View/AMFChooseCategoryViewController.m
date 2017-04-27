//
//  AMFChooseCategoryViewController.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryViewController.h"
#import "AMFCategoryProtocol.h"

#import "AMFChooseCategoryViewOutput.h"

static NSString *const chooseCatCellIndentifier = @"chooseCategoryCell";

@interface AMFChooseCategoryViewController () <UITableViewDelegate, UITableViewDataSource>

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
    NSLog(@"count: %ld", (long)self.categories.count);
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:chooseCatCellIndentifier];
    id <AMFCategoryProtocol> category = [self.categories objectAtIndex:indexPath.row];
    if (self.selectedCategory && // selected cell could be nil
        [category.name isEqualToString:self.selectedCategory.name]) {
        [cell setAccessoryType:UITableViewCellAccessoryCheckmark];
    }
    else
        [cell setAccessoryType:UITableViewCellAccessoryNone];
    cell.textLabel.text = category.name;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    id <AMFCategoryProtocol> category = [self.categories objectAtIndex:indexPath.row];
    [self.output categorySelected:category];
}

@end