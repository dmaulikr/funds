//
//  AMFAddRecordAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordAssembly.h"

#import "AMFAddRecordViewController.h"
#import "AMFAddRecordInteractor.h"
#import "AMFAddRecordPresenter.h"
#import "AMFAddRecordRouter.h"
#import "AMFAlertsAssembly.h"
#import "AMFDataSupplierAssembly.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFAddRecordAssembly

- (AMFAddRecordViewController *)viewAddRecord {
    return [TyphoonDefinition withClass:[AMFAddRecordViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAddRecord]];
                              [definition injectProperty:@selector(moduleInput)
                                                    with:[self presenterAddRecord]];
                          }];
}

- (AMFAddRecordInteractor *)interactorAddRecord {
    return [TyphoonDefinition withClass:[AMFAddRecordInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(storage)
                                                    with:_dataProvider.storageHandler];
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterAddRecord]];
                          }];
}

- (AMFAddRecordPresenter *)presenterAddRecord{
    return [TyphoonDefinition withClass:[AMFAddRecordPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(view)
                                                    with:[self viewAddRecord]];
                              [definition injectProperty:@selector(interactor)
                                                    with:[self interactorAddRecord]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerAddRecord]];
                          }];
}

- (AMFAddRecordRouter *)routerAddRecord{
    return [TyphoonDefinition withClass:[AMFAddRecordRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewAddRecord]];
                              [definition injectProperty:@selector(alertFactory)
                                                    with:[_alerts alertFactory]];
                          }];
}

@end
