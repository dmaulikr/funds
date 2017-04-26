//
//  AMFWalletAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletAssembly.h"

@class AMFWalletViewController;
@class AMFWalletInteractor;
@class AMFWalletPresenter;
@class AMFWalletRouter;

/**
 @author Michael Artuerhof

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface AMFWalletAssembly ()

- (AMFWalletViewController *)viewWallet;
- (AMFWalletPresenter *)presenterWallet;
- (AMFWalletInteractor *)interactorWallet;
- (AMFWalletRouter *)routerWallet;

@end
