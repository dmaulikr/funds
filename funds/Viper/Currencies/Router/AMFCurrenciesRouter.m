//
//  AMFCurrenciesRouter.m
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrenciesRouter.h"
#import "AMFNameIconSetterModuleInput.h"
#import "AMFNameIconSetterModuleOutput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFCurrenciesRouter

#pragma mark - Methods of AMFCurrenciesRouterInput

- (void)showNameIconSetterWithName:(NSString*)name
                           andIcon:(NSString*)icon
                         andOutput:(id<AMFNameIconSetterModuleOutput>) output {
    [[self.transitionHandler openModuleUsingSegue:kSegueChooseCurrencySymbol] thenChainUsingBlock:
     ^id<AMFNameIconSetterModuleOutput>(id<AMFNameIconSetterModuleInput> moduleInput) {
         [moduleInput configureModuleWithName:name andIcon:icon];
         return output;
     }];
}

@end
