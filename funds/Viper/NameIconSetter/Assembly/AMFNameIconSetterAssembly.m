//
//  AMFNameIconSetterAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFNameIconSetterAssembly.h"

#import "AMFNameIconSetterViewController.h"
#import "AMFNameIconSetterInteractor.h"
#import "AMFNameIconSetterPresenter.h"
#import "AMFNameIconSetterRouter.h"
#import "AMFAlertsAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFNameIconSetterAssembly

- (AMFNameIconSetterViewController *)viewNameIconSetter {
    return [TyphoonDefinition withClass:[AMFNameIconSetterViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterNameIconSetter]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterNameIconSetter]];
                          }];
}

- (AMFNameIconSetterInteractor *)interactorNameIconSetter {
    return [TyphoonDefinition withClass:[AMFNameIconSetterInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterNameIconSetter]];
                          }];
}

- (AMFNameIconSetterPresenter *)presenterNameIconSetter{
    return [TyphoonDefinition withClass:[AMFNameIconSetterPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewNameIconSetter]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorNameIconSetter]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerNameIconSetter]];
                          }];
}

- (AMFNameIconSetterRouter *)routerNameIconSetter{
    return [TyphoonDefinition withClass:[AMFNameIconSetterRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewNameIconSetter]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
