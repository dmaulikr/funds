//
//  AMFFlowModuleAssembly.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowModuleAssembly.h"
#import "AMFFlowViewController.h"
#import "AMFFlowInteractor.h"
#import "AMFFlowPresenter.h"
#import "AMFFlowRouter.h"
#import "AMFThemeAssembly.h"
#import "AMFDataSupplierAssembly.h"

@implementation AMFFlowModuleAssembly

-(AMFFlowViewController*) viewFlowModule {
    return [TyphoonDefinition withClass:[AMFFlowViewController class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(input)
                                                    with:_dataProvider.dataSupplier];
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFlowModule]];
                              [definition injectProperty:@selector(theme)
                                                    with:[_themeProvider currentTheme]];
                          }];
}
            
-(AMFFlowInteractor*) interactorFlowModule {
    return [TyphoonDefinition withClass:[AMFFlowInteractor class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(output)
                                                    with:[self presenterFlowModule]];
                          }];
}

-(AMFFlowPresenter*) presenterFlowModule {
    return [TyphoonDefinition withClass:[AMFFlowPresenter class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                              [definition injectProperty:@selector(view)
                                                    with:[self viewFlowModule]];
                              [definition injectProperty:@selector(iteractor)
                                                    with:[self interactorFlowModule]];
                              [definition injectProperty:@selector(router)
                                                    with:[self routerFlowModule]];
                          }];
}


-(AMFFlowRouter*) routerFlowModule {
    return [TyphoonDefinition withClass:[AMFFlowRouter class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                              [definition injectProperty:@selector(transitionHandler)
                                                    with:[self viewFlowModule]];
                              
                          }];
}
@end
