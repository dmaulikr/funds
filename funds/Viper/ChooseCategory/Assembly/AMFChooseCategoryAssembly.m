//
//  AMFChooseCategoryAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryAssembly.h"

#import "AMFChooseCategoryViewController.h"
#import "AMFChooseCategoryInteractor.h"
#import "AMFChooseCategoryPresenter.h"
#import "AMFChooseCategoryRouter.h"
#import "AMFAlertsAssembly.h"
#import "AMFDataSupplierAssembly.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFChooseCategoryAssembly

- (AMFChooseCategoryViewController *)viewChooseCategory {
    return [TyphoonDefinition withClass:[AMFChooseCategoryViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterChooseCategory]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterChooseCategory]];
                          }];
}

- (AMFChooseCategoryInteractor *)interactorChooseCategory {
    return [TyphoonDefinition withClass:[AMFChooseCategoryInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterChooseCategory]];
                          }];
}

- (AMFChooseCategoryPresenter *)presenterChooseCategory{
    return [TyphoonDefinition withClass:[AMFChooseCategoryPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewChooseCategory]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorChooseCategory]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerChooseCategory]];
                          }];
}

- (AMFChooseCategoryRouter *)routerChooseCategory{
    return [TyphoonDefinition withClass:[AMFChooseCategoryRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewChooseCategory]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
