//
//  AMFChooseCategoryRouter.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryRouter.h"
#import "AMFCategoryProtocol.h"
#import "AMFEditCategoryModuleOutput.h"
#import "AMFEditCategoryModuleInput.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFChooseCategoryRouter

#pragma mark - Methods of AMFChooseCategoryRouterInput

- (void)closeMe {
    [self.transitionHandler closeCurrentModule:YES];
}

- (void)editCategoryName:(id<AMFCategoryProtocol>)category
                                      andOutput:(id<AMFEditCategoryModuleOutput>) output {
    [[self.transitionHandler openModuleUsingSegue:kSegueEditCategory] thenChainUsingBlock:^id<AMFEditCategoryModuleOutput>(id<AMFEditCategoryModuleInput> moduleInput) {
        [moduleInput configureModuleWithCategoryName:category];
        return output;
    }];
}

@end
