//
//  AMFCurrenciesViewController.m
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrenciesViewController.h"
#import "AMFCurrenciesViewOutput.h"
#import "AMFCurrencyProtocol.h"

static NSString *const currencyCellIndentifier = @"currencyCell";

@interface AMFCurrenciesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFCurrenciesViewController

@synthesize records;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.output updateDataBeforeViewWillAppear];
}

#pragma mark - Methods of AMFCurrenciesViewInput

- (void)setupInitialState {
	// setup anything needed for view for its functioning
    self.title = AMFLocalize(@"Currencies");
}

- (void)refreshContents {
    [self.tableView reloadData];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:currencyCellIndentifier];
    id<AMFCurrencyProtocol> cur = self.records[indexPath.row];
    cell.textLabel.text = cur.symbol.length ? cur.symbol : cur.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%g", cur.rate];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    /*
     if (editingStyle == UITableViewCellEditingStyleDelete) {
     [self.output cellToDelete:indexPath.row];
     }
     */
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.output cellSelected:indexPath.row];
}

@end
