//
//  AMFEditCategoryAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryAssembly.h"

#import "AMFEditCategoryViewController.h"
#import "AMFEditCategoryInteractor.h"
#import "AMFEditCategoryPresenter.h"
#import "AMFEditCategoryRouter.h"
#import "AMFAlertsAssembly.h"
#import "AMFDataSupplierAssembly.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFEditCategoryAssembly

- (AMFEditCategoryViewController *)viewEditCategory {
    return [TyphoonDefinition withClass:[AMFEditCategoryViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterEditCategory]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterEditCategory]];
                          }];
}

- (AMFEditCategoryInteractor *)interactorEditCategory {
    return [TyphoonDefinition withClass:[AMFEditCategoryInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(storage)
                                                    with:_dataProvider.storageHandler];
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterEditCategory]];
                          }];
}

- (AMFEditCategoryPresenter *)presenterEditCategory{
    return [TyphoonDefinition withClass:[AMFEditCategoryPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewEditCategory]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorEditCategory]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerEditCategory]];
                          }];
}

- (AMFEditCategoryRouter *)routerEditCategory{
    return [TyphoonDefinition withClass:[AMFEditCategoryRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewEditCategory]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
