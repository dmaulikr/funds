//
//  AMFSettingsAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFSettingsAssembly.h"
#import "AMFSettingsViewController.h"
#import "AMFThemeAssembly.h"

@implementation AMFSettingsAssembly

- (AMFSettingsViewController *)settingsView {
    return [TyphoonDefinition withClass:[AMFSettingsViewController class] configuration:^(TyphoonDefinition *definition) {
                [definition injectProperty:@selector(theme) with:[_themeProvider currentTheme]];
            }];
}

@end
