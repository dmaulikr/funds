//
//  AMFAddRecordViewController.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordViewController.h"

#import "AMFAddRecordViewOutput.h"

@interface AMFAddRecordViewController ()

@property (nonatomic, weak) IBOutlet UILabel *walletName;
@property (nonatomic, weak) IBOutlet UIImageView *walletImage;
@property (nonatomic, weak) IBOutlet UILabel *walletAmount;
@property (nonatomic, weak) IBOutlet UILabel *walletCurrency;
@property (nonatomic, weak) IBOutlet UITextField *inputAmount;
@property (nonatomic, weak) IBOutlet UILabel *inputCurrency;
@property (nonatomic, weak) IBOutlet UITextField *descr;

@end

@implementation AMFAddRecordViewController

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Methods AMFAddRecordViewInput

- (void)setupInitialState {
    UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"done"]
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(done)];
    self.navigationItem.rightBarButtonItem = done;
}

#pragma mark - Themes

- (void)applyTheme {
    [super applyTheme];
}

#pragma mark - Actions

- (void)done {
    [self.output createRecordWithTitle:self.inputAmount.text andDescription:self.descr.text];
}

- (IBAction)inputCurrencyTouched:(id)sender {
    [self.output changeInputCurrency];
}

- (IBAction)walletCurrencyTouched:(id)sender {
    [self.output changeWalletCurrency];
}

- (IBAction)walletIconTouched:(id)sender {
    [self.output changeWallet];
}

- (IBAction)categoryTouched:(id)sender {
    [self.output changeCatogory];
}

@end
