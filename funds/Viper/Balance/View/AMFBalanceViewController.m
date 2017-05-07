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

static NSString *const balanceCellIndentifier = @"balanceCell";

@interface AMFBalanceViewController () <UITableViewDelegate, UITableViewDataSource> {
    UIBarButtonItem *_right;
    UIBarButtonItem *_left;
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
        // previous month
        _left = [[UIBarButtonItem alloc] initWithTitle:AMFLocalize(@"Back")
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self
                                                                action:@selector(goBackward)];
        self.navigationItem.leftBarButtonItem = _left;
    }

    if (!self.navigationItem.rightBarButtonItem) {
        // next month or total amounts
        _right = [[UIBarButtonItem alloc] initWithTitle:AMFLocalize(@"Total")
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
}

- (void)goForward {
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.records.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:balanceCellIndentifier];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //[self.output cellSelected:indexPath.row];
}

@end
