//
//  AMFThemeBaseController.m
//  iMemor
//
//  Created by Michael Artuerhof on 16.03.2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFThemeBaseController.h"
#import "AMFThemeFactory.h" // for notification about theme's changing

static NSUInteger kIndicatorWidth = 80;
static NSUInteger kIndicatorCornerRadius = 10;

@implementation AMFThemeBaseController

@synthesize theme;

- (UIActivityIndicatorView *)activeIndicator {
    if (!_activeIndicator) {
        _activeIndicator = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, kIndicatorWidth, kIndicatorWidth)];
        _activeIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
        _activeIndicator.backgroundColor = [[UIColor alloc] initWithWhite:0.3 alpha:0.8];
        _activeIndicator.layer.cornerRadius = kIndicatorCornerRadius;
        _activeIndicator.center = self.view.center;
        [self.view addSubview:_activeIndicator];
    }
    return _activeIndicator;
}

- (void)setupInitialState {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(themeChangedWith:)
                                                 name:kThemeChanged
                                               object:nil];
}

- (void)themeChangedWith:(NSNotification *)themeNotification {
    AMFTheme *newTheme = themeNotification.object;
    if (newTheme) {
        self.theme = newTheme;
        [self applyTheme];
    }
}

#pragma mark - Methods of AMFThemeable

- (void)applyTheme {
}

#pragma mark - Traits

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    self.activeIndicator.center = self.view.center;
}

@end
