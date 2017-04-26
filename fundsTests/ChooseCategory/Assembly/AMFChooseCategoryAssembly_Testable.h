//
//  AMFChooseCategoryAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryAssembly.h"

@class AMFChooseCategoryViewController;
@class AMFChooseCategoryInteractor;
@class AMFChooseCategoryPresenter;
@class AMFChooseCategoryRouter;

/**
 @author Michael Artuerhof

 Extension which makes private methods public for tests
 */
@interface AMFChooseCategoryAssembly ()

- (AMFChooseCategoryViewController *)viewChooseCategory;
- (AMFChooseCategoryPresenter *)presenterChooseCategory;
- (AMFChooseCategoryInteractor *)interactorChooseCategory;
- (AMFChooseCategoryRouter *)routerChooseCategory;

@end
