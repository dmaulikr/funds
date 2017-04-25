//
//  AMFAddRecordInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordInteractorInput.h"

@protocol AMFAddRecordInteractorOutput;
@protocol AMFStorageHandlerProtocol;

@interface AMFAddRecordInteractor : NSObject <AMFAddRecordInteractorInput>

@property (nonatomic, weak) id<AMFAddRecordInteractorOutput> output;

/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@end
