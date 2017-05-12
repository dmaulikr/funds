//
//  AMFCurrenciesAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrenciesAssembly.h"

#import "AMFCurrenciesViewController.h"
#import "AMFCurrenciesInteractor.h"
#import "AMFCurrenciesPresenter.h"
#import "AMFCurrenciesRouter.h"
#import "AMFThemeAssembly.h"
#import "AMFAlertsAssembly.h"
#import "AMFDataSupplierAssembly.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFCurrenciesAssembly

- (AMFCurrenciesViewController *)viewCurrencies {
    return [TyphoonDefinition withClass:[AMFCurrenciesViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterCurrencies]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterCurrencies]];
                              [definition injectProperty:@selector(theme)
                                                    with:[_themeProvider currentTheme]];
                          }];
}

- (AMFCurrenciesInteractor *)interactorCurrencies {
    return [TyphoonDefinition withClass:[AMFCurrenciesInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(storage)
                                                    with:_dataProvider.storageHandler];
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterCurrencies]];
                          }];
}

- (AMFCurrenciesPresenter *)presenterCurrencies{
    return [TyphoonDefinition withClass:[AMFCurrenciesPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewCurrencies]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorCurrencies]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerCurrencies]];
                          }];
}

- (AMFCurrenciesRouter *)routerCurrencies{
    return [TyphoonDefinition withClass:[AMFCurrenciesRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewCurrencies]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
