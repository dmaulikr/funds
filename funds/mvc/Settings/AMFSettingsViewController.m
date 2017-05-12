//
//  AMFSettingsViewController.m
//  funds
//
//  Created by Michael on 11.05.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFSettingsViewController.h"
#import "AMFThemeFactory.h"
#import "AMFTheme.h"

@interface AMFSettingsViewController ()

@end

@implementation AMFSettingsViewController

@synthesize theme;

- (void)viewDidLoad {
    [super viewDidLoad];
    // code dublication of AMFThemeBaseController, but I cannot inherit from it
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(themeChangedWith:)
                                                 name:kThemeChanged
                                               object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)themeChangedWith:(NSNotification *)themeNotification {
    AMFTheme *newTheme = themeNotification.object;
    if (newTheme) {
        self.theme = newTheme;
        [self applyTheme];
    }
}

#pragma mark - Methods of AMFThemeable

- (void)typhoonDidInject {
    [self applyTheme];
}

- (void)applyTheme {
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}

@end
