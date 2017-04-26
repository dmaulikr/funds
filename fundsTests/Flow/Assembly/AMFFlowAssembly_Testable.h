//
//  AMFFlowAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 10/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowModuleAssembly.h"

@class AMFFlowViewController;
@class AMFFlowInteractor;
@class AMFFlowPresenter;
@class AMFFlowRouter;

/**
 @author Michael Artuerhof

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface AMFFlowModuleAssembly ()

- (AMFFlowViewController *)viewFlowModule;
- (AMFFlowPresenter *)presenterFlowModule;
- (AMFFlowInteractor *)interactorFlowModule;
- (AMFFlowRouter *)routerFlowModule;

@end
