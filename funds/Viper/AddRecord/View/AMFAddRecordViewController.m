//
//  AMFAddRecordViewController.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordViewController.h"
#import "AMFCategoryProtocol.h"
#import "AMFAddRecordViewOutput.h"

@interface AMFAddRecordViewController ()

@property (nonatomic, weak) IBOutlet UILabel *walletName;
@property (nonatomic, weak) IBOutlet UIImageView *walletImage;
@property (nonatomic, weak) IBOutlet UILabel *walletAmount;
@property (nonatomic, weak) IBOutlet UILabel *walletCurrency;
@property (nonatomic, weak) IBOutlet UITextField *inputAmount;
@property (nonatomic, weak) IBOutlet UILabel *inputCurrency;
@property (nonatomic, weak) IBOutlet UITextField *descr;
@property (nonatomic, weak) IBOutlet UIImageView *categoryImage;
@property (nonatomic, weak) IBOutlet UILabel *category;

@end

@implementation AMFAddRecordViewController

@synthesize selectedCategory,
selectedCurrency;

#pragma mark - Life Cycle Methods

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.output didTriggerViewReadyEvent];
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    [self.category sizeToFit];
}

#pragma mark - Methods AMFAddRecordViewInput

- (void)setupInitialState {
    if (!self.navigationItem.rightBarButtonItem) {
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"done"]
                                                                 style:UIBarButtonItemStyleDone
                                                                target:self
                                                                action:@selector(done)];
        self.navigationItem.rightBarButtonItem = done;
    }

    [self refreshView];
}

- (void)setupView {
    [self refreshView];
}

- (void)refreshView {
    if (self.selectedCategory) {
        NSString *img = self.selectedCategory.icon_path;
        if (img.length)
            self.categoryImage.image = [UIImage imageNamed:img];
        else
            self.categoryImage.image = [UIImage imageNamed:@"help"];
        self.category.text = self.selectedCategory.name;
    }

    if (self.selectedCurrency) {
        self.inputCurrency.text = self.selectedCurrency.symbol.length ?
        self.selectedCurrency.symbol :
        self.selectedCurrency.name;
    }
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

- (IBAction)inputAmountBegan:(id)sender {
    if (!self.inputAmount.text)
        self.inputAmount.text = @"";

    if (self.inputAmount.text.length)
        return;

    self.inputAmount.text = [NSString stringWithFormat:@"-%@", self.inputAmount.text];
}

- (IBAction)changeSign:(id)sender {
    double f = [self.inputAmount.text doubleValue];
    if (f < 0) {
        self.inputAmount.text = [self.inputAmount.text substringFromIndex:1];
    } else if (fabs(f) > 0.00001) {
        self.inputAmount.text = [NSString stringWithFormat:@"-%@", self.inputAmount.text];
    }
}
@end
