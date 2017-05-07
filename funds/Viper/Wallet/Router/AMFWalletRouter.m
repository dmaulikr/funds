//
//  AMFWalletRouter.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletRouter.h"
#import "AMFNameIconSetterModuleInput.h"
#import "AMFNameIconSetterModuleOutput.h"
#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFWalletRouter

#pragma mark - Methods of AMFWalletRouterInput

- (void)showNameIconSetterWithName:(NSString*)name
                           andIcon:(NSString*)icon
                         andOutput:(id<AMFNameIconSetterModuleOutput>) output {
    [[self.transitionHandler openModuleUsingSegue:kSegueChangeNameIcon] thenChainUsingBlock:^id<AMFNameIconSetterModuleOutput>(id<AMFNameIconSetterModuleInput> moduleInput) {
        [moduleInput configureModuleWithName:name andIcon:icon];
        return output;
    }];
}

@end
