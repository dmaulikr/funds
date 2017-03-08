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
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Themes

- (void)typhoonDidInject {
    [self applyTheme];
}

- (void)applyTheme {
    LogDebug(@"navigation font: %@; size: %ld", _theme.navigationFontName, (long) _theme.navigationFontSize);
    
}
@end
