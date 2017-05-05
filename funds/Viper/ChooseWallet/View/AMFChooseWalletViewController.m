//
//  AMFChooseWalletViewController.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseWalletViewController.h"
#import "AMFWalletProtocol.h"
#import "AMFChooseWalletViewOutput.h"

static NSString *const walletCellIndentifier = @"walletCell";

@interface AMFChooseWalletViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation AMFChooseWalletViewController

@synthesize records;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы AMFChooseWalletViewInput

- (void)setupInitialState {
	// setup anything needed for view for its functioning
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
    //[self.output addWallet];
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
