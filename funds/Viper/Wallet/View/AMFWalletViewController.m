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

@implementation AMFWalletViewController

#pragma mark - Методы жизненного цикла

- (void)viewDidLoad {
	[super viewDidLoad];
    
    LogDebug(@"AMFWalletViewController didLoad");

	[self.output didTriggerViewReadyEvent];
}

#pragma mark - Методы AMFWalletViewInput

- (void)setupInitialState {
	// В этом методе происходит настройка параметров view, зависящих от ее жизненого цикла (создание элементов, анимации и пр.)
}

#pragma mark - Themes

- (void)typhoonDidInject {
    [self applyTheme];
}

- (void)applyTheme {
    [super applyTheme];
}
@end
