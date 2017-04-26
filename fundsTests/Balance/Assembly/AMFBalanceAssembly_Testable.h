//
//  AMFBalanceAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceAssembly.h"

@class AMFBalanceViewController;
@class AMFBalanceInteractor;
@class AMFBalancePresenter;
@class AMFBalanceRouter;

/**
 @author Michael Artuerhof

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface AMFBalanceAssembly ()

- (AMFBalanceViewController *)viewBalance;
- (AMFBalancePresenter *)presenterBalance;
- (AMFBalanceInteractor *)interactorBalance;
- (AMFBalanceRouter *)routerBalance;

@end
