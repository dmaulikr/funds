//
//  AMFEditCategoryAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryAssembly.h"

@class AMFEditCategoryViewController;
@class AMFEditCategoryInteractor;
@class AMFEditCategoryPresenter;
@class AMFEditCategoryRouter;

/**
 @author Michael Artuerhof

 Extension which makes private methods public for tests
 */
@interface AMFEditCategoryAssembly ()

- (AMFEditCategoryViewController *)viewEditCategory;
- (AMFEditCategoryPresenter *)presenterEditCategory;
- (AMFEditCategoryInteractor *)interactorEditCategory;
- (AMFEditCategoryRouter *)routerEditCategory;

@end
