//
//  AMFBalanceViewController.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceViewController.h"
#import "AMFTheme.h"
#import "AMFBalanceViewOutput.h"
#import "AMFBalanceItem.h"
#import "AMFCashProtocol.h"
#import "AMFCategoryProtocol.h"

static NSString *const balanceCellIndentifier = @"balanceCell";
static NSString *const titleCellIndentifier = @"pageNameCell";

@interface AMFBalanceViewController () <UITableViewDelegate, UITableViewDataSource> {
    UIBarButtonItem *_right;
    UIBarButtonItem *_left;
    NSString *_pageTitle;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFBalanceViewController

@synthesize records;

#pragma mark - Life cycle events

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Methods of AMFBalanceViewInput

- (void)setupInitialState {
    if (!self.navigationItem.leftBarButtonItem) {
        // previous page
        _left = [[UIBarButtonItem alloc] initWithTitle:AMFLocalize(@"Back")
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self
                                                                action:@selector(goBackward)];
        self.navigationItem.leftBarButtonItem = _left;
    }

    if (!self.navigationItem.rightBarButtonItem) {
        // next page or total amounts
        _right = [[UIBarButtonItem alloc] initWithTitle:AMFLocalize(@"Next")
                                                                  style:UIBarButtonItemStyleBordered
                                                                 target:self
                                                                 action:@selector(goForward)];
        self.navigationItem.rightBarButtonItem = _right;
    }
}

- (void)refreshContents {
    [self.tableView reloadData];
}

- (void)goBackward {
    [self.output prevReportButtonPressed];
}

- (void)goForward {
    [self.output nextReportButtonPressed];
}

- (void)setNamesOfUpperButtons:(NSString*)left andRight:(NSString*)right {
    if (left) {
        _left.title = left;
        _left.enabled = YES;
    }
    else
        _left.enabled = NO;

    if (right) {
        _right.title = right;
        _right.enabled = YES;
    }
    else
        _right.enabled = NO;
}

- (void)setCurrentPageTitle:(NSString*)title {
    _pageTitle = title;
}

#pragma mark - Themes

- (void)typhoonDidInject {
    [self applyTheme];
}

- (void)applyTheme {
    [super applyTheme];
}

#pragma mark - Table View source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2; // title + reports
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) // title cell?
        return 1;
    return self.records.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    if (indexPath.section == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:titleCellIndentifier];
        cell.textLabel.text = _pageTitle;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
    } else if (indexPath.section == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:balanceCellIndentifier];
        AMFBalanceItem *item = self.records[indexPath.row];
        switch (item.type) {
            case AMFBalanceItemTypeCategory:
                cell.textLabel.text = item.category.name;
                break;

            case AMFBalanceItemTypeTotalAdditions:
                cell.textLabel.text = AMFLocalize(@"Income");
                cell.imageView.image = nil;
                break;

            case AMFBalanceItemTypeTotalLoses:
                cell.textLabel.text = AMFLocalize(@"Outcome");
                cell.imageView.image = nil;
                break;

            default:
                cell.textLabel.text = @"?";
                break;
        }
        if (item.type == AMFBalanceItemTypeCategory) {
            cell.textLabel.text = item.category.name;
            cell.imageView.image = [UIImage imageNamed:item.category.icon_path.length ?
                                    item.category.icon_path : @"help"];
        }
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%g", item.amount];
    }
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[self.output cellSelected:indexPath.row];
}

@end
