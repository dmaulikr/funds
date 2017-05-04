//
//  AMFWalletInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletInteractorInput.h"

@protocol AMFWalletInteractorOutput;
@protocol AMFStorageHandlerProtocol;

@interface AMFWalletInteractor : NSObject <AMFWalletInteractorInput>

/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@property (nonatomic, weak) id<AMFWalletInteractorOutput> output;

@end
