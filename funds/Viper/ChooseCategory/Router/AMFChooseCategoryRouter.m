//
//  AMFChooseCategoryRouter.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryRouter.h"
#import "AMFCategoryProtocol.h"
#import "AMFNameIconSetterModuleInput.h"
#import "AMFNameIconSetterModuleOutput.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFChooseCategoryRouter

#pragma mark - Methods of AMFChooseCategoryRouterInput

- (void)closeMe {
    [self.transitionHandler closeCurrentModule:YES];
}

- (void)showNameIconSetterWithName:(NSString*)name
                           andIcon:(NSString*)icon
                         andOutput:(id<AMFNameIconSetterModuleOutput>) output {
    [[self.transitionHandler openModuleUsingSegue:kSegueChangeNameIconForCategory] thenChainUsingBlock:^id<AMFNameIconSetterModuleOutput>(id<AMFNameIconSetterModuleInput> moduleInput) {
        [moduleInput configureModuleWithName:name andIcon:icon];
        return output;
    }];
}

@end
