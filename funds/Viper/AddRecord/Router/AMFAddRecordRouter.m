//
//  AMFAddRecordRouter.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordRouter.h"
#import "AMFChooseCategoryModuleInput.h"
#import "AMFChooseCategoryModuleOutput.h"
#import "AMFChooseWalletModuleInput.h"
#import "AMFChooseWalletModuleOutput.h"

#import <ViperMcFlurry/ViperMcFlurry.h>

@implementation AMFAddRecordRouter

#pragma mark - Methods of AMFAddRecordRouterInput

- (void)closeMe {
    [self.transitionHandler closeCurrentModule:YES];
}

- (void)showCategoryChooserWithCategorySelected:(id<AMFCategoryProtocol>)category
                                      andOutput:(id<AMFChooseCategoryModuleOutput>) output {
    [[self.transitionHandler openModuleUsingSegue:kSegueChooseCategory] thenChainUsingBlock:^id<AMFChooseCategoryModuleOutput>(id<AMFChooseCategoryModuleInput> moduleInput) {
        [moduleInput configureModuleWithCategorySelected:category];
        return output;
    }];
}

- (void)showWalletChooserWithWalletSelected:(id<AMFWalletProtocol>)wallet
                                      andOutput:(id<AMFChooseWalletModuleOutput>)output {
    [[self.transitionHandler openModuleUsingSegue:kSegueChooseWallet] thenChainUsingBlock:^id<AMFChooseWalletModuleOutput>(id<AMFChooseWalletModuleInput> moduleInput) {
        [moduleInput configureModuleWithWallet:wallet];
        return output;
    }];
}

@end
