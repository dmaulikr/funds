//
//  AMFAddPageAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageAssembly.h"

#import "AMFAddPageViewController.h"
#import "AMFAddPageInteractor.h"
#import "AMFAddPagePresenter.h"
#import "AMFAddPageRouter.h"
#import "AMFAlertsAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFAddPageAssembly

- (AMFAddPageViewController *)viewAddPage {
    return [TyphoonDefinition withClass:[AMFAddPageViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAddPage]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterAddPage]];
                          }];
}

- (AMFAddPageInteractor *)interactorAddPage {
    return [TyphoonDefinition withClass:[AMFAddPageInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAddPage]];
                          }];
}

- (AMFAddPagePresenter *)presenterAddPage{
    return [TyphoonDefinition withClass:[AMFAddPagePresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewAddPage]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorAddPage]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerAddPage]];
                          }];
}

- (AMFAddPageRouter *)routerAddPage{
    return [TyphoonDefinition withClass:[AMFAddPageRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewAddPage]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
