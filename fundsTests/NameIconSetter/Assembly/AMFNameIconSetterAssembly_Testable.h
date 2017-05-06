//
//  AMFNameIconSetterAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFNameIconSetterAssembly.h"

@class AMFNameIconSetterViewController;
@class AMFNameIconSetterInteractor;
@class AMFNameIconSetterPresenter;
@class AMFNameIconSetterRouter;

/**
 @author Michael Artuerhof

 Extension which makes private methods public for tests
 */
@interface AMFNameIconSetterAssembly ()

- (AMFNameIconSetterViewController *)viewNameIconSetter;
- (AMFNameIconSetterPresenter *)presenterNameIconSetter;
- (AMFNameIconSetterInteractor *)interactorNameIconSetter;
- (AMFNameIconSetterRouter *)routerNameIconSetter;

@end
