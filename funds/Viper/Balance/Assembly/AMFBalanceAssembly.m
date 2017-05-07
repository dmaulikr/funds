//
//  AMFBalanceAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceAssembly.h"

#import "AMFBalanceViewController.h"
#import "AMFBalanceInteractor.h"
#import "AMFBalancePresenter.h"
#import "AMFBalanceRouter.h"
#import "AMFThemeAssembly.h"
#import "AMFAlertsAssembly.h"
#import "AMFDataSupplierAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFBalanceAssembly

- (AMFBalanceViewController *)viewBalance {
    return [TyphoonDefinition withClass:[AMFBalanceViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterBalance]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterBalance]];
                              [definition injectProperty:@selector(theme)
                                                    with:[_themeProvider currentTheme]];
                          }];
}

- (AMFBalanceInteractor *)interactorBalance {
    return [TyphoonDefinition withClass:[AMFBalanceInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterBalance]];
                              [definition injectProperty:@selector(storage)
                                                    with:_dataProvider.storageHandler];
                          }];
}

- (AMFBalancePresenter *)presenterBalance{
    return [TyphoonDefinition withClass:[AMFBalancePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewBalance]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorBalance]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerBalance]];
                          }];
}

- (AMFBalanceRouter *)routerBalance{
    return [TyphoonDefinition withClass:[AMFBalanceRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewBalance]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
