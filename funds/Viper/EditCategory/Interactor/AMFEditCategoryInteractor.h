//
//  AMFEditCategoryInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFEditCategoryInteractorInput.h"

@protocol AMFStorageHandlerProtocol;
@protocol AMFEditCategoryInteractorOutput;

@interface AMFEditCategoryInteractor : NSObject <AMFEditCategoryInteractorInput>

/**
 * data source to be used for showing contents
 */
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@property (nonatomic, weak) id<AMFEditCategoryInteractorOutput> output;

@end
