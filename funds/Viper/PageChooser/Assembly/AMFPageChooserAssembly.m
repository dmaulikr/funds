//
//  AMFPageChooserAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserAssembly.h"

#import "AMFPageChooserViewController.h"
#import "AMFPageChooserInteractor.h"
#import "AMFPageChooserPresenter.h"
#import "AMFPageChooserRouter.h"
#import "AMFDataSupplierAssembly.h"
#import "AMFAlertsAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFPageChooserAssembly

- (AMFPageChooserViewController *)viewPageChooser {
    return [TyphoonDefinition withClass:[AMFPageChooserViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterPageChooser]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterPageChooser]];
                          }];
}

- (AMFPageChooserInteractor *)interactorPageChooser {
    return [TyphoonDefinition withClass:[AMFPageChooserInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(dataSupply)
                                                    with:_dataProvider.dataSupplier];
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterPageChooser]];
                          }];
}

- (AMFPageChooserPresenter *)presenterPageChooser{
    return [TyphoonDefinition withClass:[AMFPageChooserPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewPageChooser]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorPageChooser]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerPageChooser]];
                          }];
}

- (AMFPageChooserRouter *)routerPageChooser{
    return [TyphoonDefinition withClass:[AMFPageChooserRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewPageChooser]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
