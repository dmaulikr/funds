//
//  AMFFlowViewController.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowViewController.h"
#import "AMFFlowViewOutput.h"
#import "AMFTheme.h"
#import "AMFFlowCell.h"
#import "AMFCashProtocol.h"
#import "AMFCurrencyProtocol.h"
#import "AMFFlowModuleAssembly.h"
#import "AMFFlowData.h"

static NSString *const flowCellIndentifier = @"FlowCell";

@interface AMFFlowViewController () <UITableViewDelegate, UITableViewDataSource, AMFFlowCellProtocol>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFFlowViewController

@synthesize records;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.output setupView];
}

- (void)viewWillAppear:(BOOL)animated {
    if (!self.records.count)
        [self.output setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Методы AMFWalletViewInput

- (void)setupInitialState {
    [self applyTheme];
    // setup left button - for choosing pages
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:AMFLocalize(@"PAGES")
                                                             style:UIBarButtonItemStyleBordered
                                                            target:self
                                                            action:@selector(choosePage)];
    self.navigationItem.leftBarButtonItem = left;

    // adding new records:
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                           target:self
                                                                           action:@selector(addRecord)];
    self.navigationItem.rightBarButtonItem = right;
}

- (void)refreshContents {
    [self.tableView reloadData];
}

- (void)setToolbarTitle:(NSString*) title {
    if (title == nil || [self.title isEqualToString:title])
        return;
    self.title = title;
}

#pragma mark - Themes

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
    AMFFlowCell *cell = [tableView dequeueReusableCellWithIdentifier:flowCellIndentifier];
    AMFFlowData *data = [self.records objectAtIndex:indexPath.row];

    assert(cell);

    // apply our stuff (like e.g. themes)
    [self.assembly inject:cell];

    // cell configuration
    cell.categoryView.image = [UIImage imageNamed:data.icon];
    cell.descr.text = data.descr;
    cell.amount.text = data.amount;
    cell.currency.text = data.currency;
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.output cellToDelete:indexPath.row];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.output cellSelected:indexPath.row];
}

#pragma mark - Actions

- (void)choosePage {
    [self.output choosePage];
}

- (void)addRecord {
    [self.output addClicked];
}

@end
