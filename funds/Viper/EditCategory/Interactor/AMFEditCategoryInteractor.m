//
//  AMFEditCategoryInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryInteractor.h"

#import "AMFEditCategoryInteractorOutput.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFCategoryProtocol.h"

@interface AMFEditCategoryInteractor () {
    id<AMFCategoryProtocol> _category;
}
@end

@implementation AMFEditCategoryInteractor

#pragma mark - Methods of AMFEditCategoryInteractorInput

- (void)changeCategory:(id<AMFCategoryProtocol>)category modifyName:(NSString*)name {
    if (!_category) {
        _category = [self.storage grabCategoryWithName:category.name];
    }
    if (_category) {
        _category.name = name;
    }
}

- (void)changeCategory:(id<AMFCategoryProtocol>)category modifyIcon:(NSString*)icon_name {
    if (!_category) {
        _category = [self.storage grabCategoryWithName:category.name];
    }
    if (_category) {
        _category.icon_path = icon_name;
    }
}

@end
