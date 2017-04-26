//
//  AMFPageChooserAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserAssembly.h"

@class AMFPageChooserViewController;
@class AMFPageChooserInteractor;
@class AMFPageChooserPresenter;
@class AMFPageChooserRouter;

/**
 @author Michael Artuerhof

 Extension, который делает приватные методы фабрики открытыми для тестирования. 
 */
@interface AMFPageChooserAssembly ()

- (AMFPageChooserViewController *)viewPageChooser;
- (AMFPageChooserPresenter *)presenterPageChooser;
- (AMFPageChooserInteractor *)interactorPageChooser;
- (AMFPageChooserRouter *)routerPageChooser;

@end
