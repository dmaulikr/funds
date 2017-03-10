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

@interface AMFFlowViewController ()

@end

@implementation AMFFlowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.output didTriggerViewReadyEvent];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Методы AMFWalletViewInput

- (void)setupInitialState {
    // setups view's elements which are crucial to it (elements, animations, etc.)
}

#pragma mark - Themes

- (void)typhoonDidInject {
    [self applyTheme];
}

- (void)applyTheme {
    LogDebug(@"navigation font: %@; size: %ld", _theme.navigationFontName, (long) _theme.navigationFontSize);
}
@end
