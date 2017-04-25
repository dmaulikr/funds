//
//  AMFAddRecordAssembly_Testable.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordAssembly.h"

@class AMFAddRecordViewController;
@class AMFAddRecordInteractor;
@class AMFAddRecordPresenter;
@class AMFAddRecordRouter;

/**
 @author Michael Artuerhof

 Extension which makes private methods public for tests
 */
@interface AMFAddRecordAssembly ()

- (AMFAddRecordViewController *)viewAddRecord;
- (AMFAddRecordPresenter *)presenterAddRecord;
- (AMFAddRecordInteractor *)interactorAddRecord;
- (AMFAddRecordRouter *)routerAddRecord;

@end
