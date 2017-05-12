//
//  AMFWalletViewController.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletViewController.h"
#import "AMFTheme.h"
#import "AMFWalletViewOutput.h"
#import "AMFWalletProtocol.h"

static NSString *const walletCellIndentifier = @"walletCell";

@interface AMFWalletViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFWalletViewController

@synthesize records;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.output didTriggerViewReadyEvent];
}

#pragma mark - Methods of AMFWalletViewInput

- (void)setupInitialState {
    if (!self.navigationItem.leftBarButtonItem) {
        // setup left button - for choosing pages
        UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:AMFLocalize(@"Edit")
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self
                                                                action:@selector(editWallets)];
        self.navigationItem.leftBarButtonItem = left;
    }

    if (!self.navigationItem.rightBarButtonItem) {
        // adding new wallets:
        UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                               target:self
                                                                               action:@selector(addWallet)];
        self.navigationItem.rightBarButtonItem = right;
    }
}

- (void)refreshContents {
    [self.tableView reloadData];
}

- (void)editWallets {
}

- (void)addWallet {
    [self.output addWallet];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:walletCellIndentifier];
    id<AMFWalletProtocol> wallet = self.records[indexPath.row];
    cell.textLabel.text = wallet.name;
    cell.imageView.image = [UIImage imageNamed:wallet.icon_path.length ? wallet.icon_path : @"wallet-icon"];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%g", wallet.amount];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.output deleteWalletWithIndex:indexPath.row];
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.output cellSelected:indexPath.row];
}
@end
