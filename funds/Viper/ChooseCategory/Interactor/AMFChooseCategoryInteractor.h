//
//  AMFChooseCategoryInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryInteractorInput.h"

@protocol AMFChooseCategoryInteractorOutput;
@protocol AMFStorageHandlerProtocol;

@interface AMFChooseCategoryInteractor : NSObject <AMFChooseCategoryInteractorInput>

/**
 * data source to be used for showing contents
 */
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@property (nonatomic, weak) id<AMFChooseCategoryInteractorOutput> output;

@end
