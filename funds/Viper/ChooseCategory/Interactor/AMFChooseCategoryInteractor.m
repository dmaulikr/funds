//
//  AMFChooseCategoryInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryInteractor.h"
#import "AMFStorageHandlerProtocol.h"

#import "AMFChooseCategoryInteractorOutput.h"

@implementation AMFChooseCategoryInteractor

#pragma mark - Methods of AMFChooseCategoryInteractorInput

- (void)receiveAllCategories {
    [self.output categoriesReceived:[self.storage grabAllCategories]];
}

- (void)changeCategory:(id<AMFCategoryProtocol>)category withName:(NSString*)name andIcon:(NSString*)icon {
    [self.storage updateCategory:category withName:name andIcon:icon];
}

@end
