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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Методы AMFWalletViewInput

- (void)setupInitialState {
    [self applyTheme];
    // setups view's elements which are crucial to it (elements, animations, etc.)
}

- (void)refreshContents {
    [self.tableView reloadData];
}

- (void)setTitle:(NSString*) title {
    if (title == nil) return;
    self.title = title;
}

#pragma mark - Themes

- (void)applyTheme {
    LogDebug(@"navigation font: %@; size: %ld", _theme.navigationFontName, (long) _theme.navigationFontSize);
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
    //id<AMFCashProtocol> data = [self.records objectAtIndex:indexPath.row];

    assert(cell);

    // apply our stuff (like e.g. themes)
    [self.assembly inject:cell];

    // cell configuration
    //cell.categoryView.image = [UIImage imageNamed:@"AppIcon"]; // TODO: add me
    cell.descr.text = data.descr;
    cell.amount.text = data.amount;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

}
@end
