//
//  AMFPageChooserInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserInteractorInput.h"

@protocol AMFStorageHandlerProtocol;
@protocol AMFPageChooserInteractorOutput;

@interface AMFPageChooserInteractor : NSObject <AMFPageChooserInteractorInput>

/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

/**
 what's selected
 */
@property (nonatomic, weak) id<AMFPageChooserInteractorOutput> output;

@end
