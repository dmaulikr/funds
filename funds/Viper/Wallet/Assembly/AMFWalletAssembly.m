//
//  AMFWalletAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletAssembly.h"

#import "AMFWalletViewController.h"
#import "AMFWalletInteractor.h"
#import "AMFWalletPresenter.h"
#import "AMFWalletRouter.h"
#import "AMFThemeAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFWalletAssembly

- (AMFWalletViewController *)viewWallet {
    return [TyphoonDefinition withClass:[AMFWalletViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterWallet]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterWallet]];
                              [definition injectProperty:@selector(theme)
                                                    with:[_themeProvider currentTheme]];
                          }];
}

- (AMFWalletInteractor *)interactorWallet {
    return [TyphoonDefinition withClass:[AMFWalletInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterWallet]];
                          }];
}

- (AMFWalletPresenter *)presenterWallet{
    return [TyphoonDefinition withClass:[AMFWalletPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewWallet]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorWallet]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerWallet]];
                          }];
}

- (AMFWalletRouter *)routerWallet{
    return [TyphoonDefinition withClass:[AMFWalletRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewWallet]];
                          }];
}

@end
