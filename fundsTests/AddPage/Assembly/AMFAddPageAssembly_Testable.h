//
//  AMFAddPageAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageAssembly.h"

@class AMFAddPageViewController;
@class AMFAddPageInteractor;
@class AMFAddPagePresenter;
@class AMFAddPageRouter;

/**
 @author Michael Artuerhof

 Extension, which makes private methods public
 */
@interface AMFAddPageAssembly ()

- (AMFAddPageViewController *)viewAddPage;
- (AMFAddPagePresenter *)presenterAddPage;
- (AMFAddPageInteractor *)interactorAddPage;
- (AMFAddPageRouter *)routerAddPage;

@end
