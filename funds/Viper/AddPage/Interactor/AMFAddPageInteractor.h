//
//  AMFAddPageInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageInteractorInput.h"

@protocol AMFAddPageInteractorOutput;
@protocol AMFStorageHandlerProtocol;

@interface AMFAddPageInteractor : NSObject <AMFAddPageInteractorInput>

@property (nonatomic, weak) id<AMFAddPageInteractorOutput> output;

/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@end
