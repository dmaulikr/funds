//
//  AMFChooseWalletAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseWalletAssembly.h"

@class AMFChooseWalletViewController;
@class AMFChooseWalletInteractor;
@class AMFChooseWalletPresenter;
@class AMFChooseWalletRouter;

/**
 @author Michael Artuerhof

 Extension which makes private methods public for tests
 */
@interface AMFChooseWalletAssembly ()

- (AMFChooseWalletViewController *)viewChooseWallet;
- (AMFChooseWalletPresenter *)presenterChooseWallet;
- (AMFChooseWalletInteractor *)interactorChooseWallet;
- (AMFChooseWalletRouter *)routerChooseWallet;

@end
