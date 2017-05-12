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

- (void)showEditorWithLabel:(NSString*)label
                           andContents:(NSString*)content
                  andOutput:(id<AMFNameIconSetterModuleOutput>) output {
     [[self.transitionHandler openModuleUsingSegue:kSegueChooseCurrencySymbol] thenChainUsingBlock:
     ^id<AMFNameIconSetterModuleOutput>(id<AMFNameIconSetterModuleInput> moduleInput) {
         [moduleInput configureModuleWithLabel:label andName:content];
         return output;
     }];
}

- (void)showEditOptionsWithActionSymbol:(void(^)(UIAlertAction *action))symbolAction
                          andActionRate:(void(^)(UIAlertAction *action))rateAction
                          andActionName:(void(^)(UIAlertAction *action))nameAction {
    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:AMFLocalize(@"Choose action")
                                                                         message:AMFLocalize(@"What to change?")
                                                                  preferredStyle:UIAlertControllerStyleActionSheet];
    [actionSheet addAction:[UIAlertAction actionWithTitle:AMFLocalize(@"Symbol") style:UIAlertActionStyleDefault handler:symbolAction]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:AMFLocalize(@"Rate") style:UIAlertActionStyleDefault handler:rateAction]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:AMFLocalize(@"Name") style:UIAlertActionStyleDefault handler:nameAction]];
    [actionSheet addAction:[UIAlertAction actionWithTitle:AMFLocalize(@"CANCEL") style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}]];

    [(id)self.transitionHandler presentViewController:actionSheet animated:YES completion:nil];
}

@end
