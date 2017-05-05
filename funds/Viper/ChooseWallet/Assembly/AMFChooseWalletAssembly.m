//
//  AMFChooseWalletAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseWalletAssembly.h"

#import "AMFChooseWalletViewController.h"
#import "AMFChooseWalletInteractor.h"
#import "AMFChooseWalletPresenter.h"
#import "AMFChooseWalletRouter.h"
#import "AMFThemeAssembly.h"
#import "AMFAlertsAssembly.h"
#import "AMFDataSupplierAssembly.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFChooseWalletAssembly

- (AMFChooseWalletViewController *)viewChooseWallet {
    return [TyphoonDefinition withClass:[AMFChooseWalletViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterChooseWallet]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterChooseWallet]];
                              [definition injectProperty:@selector(theme)
                                                    with:[_themeProvider currentTheme]];
                          }];
}

- (AMFChooseWalletInteractor *)interactorChooseWallet {
    return [TyphoonDefinition withClass:[AMFChooseWalletInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterChooseWallet]];
                          }];
}

- (AMFChooseWalletPresenter *)presenterChooseWallet{
    return [TyphoonDefinition withClass:[AMFChooseWalletPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewChooseWallet]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorChooseWallet]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerChooseWallet]];
                          }];
}

- (AMFChooseWalletRouter *)routerChooseWallet{
    return [TyphoonDefinition withClass:[AMFChooseWalletRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewChooseWallet]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
