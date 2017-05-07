//
//  AMFBalanceInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceInteractorInput.h"

@protocol AMFBalanceInteractorOutput;
@protocol AMFStorageHandlerProtocol;

@interface AMFBalanceInteractor : NSObject <AMFBalanceInteractorInput>

/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@property (nonatomic, weak) id<AMFBalanceInteractorOutput> output;

@end
