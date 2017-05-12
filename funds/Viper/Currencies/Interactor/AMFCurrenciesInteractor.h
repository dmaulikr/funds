//
//  AMFCurrenciesInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCurrenciesInteractorInput.h"

@protocol AMFStorageHandlerProtocol;
@protocol AMFCurrenciesInteractorOutput;

@interface AMFCurrenciesInteractor : NSObject <AMFCurrenciesInteractorInput>

/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@property (nonatomic, weak) id<AMFCurrenciesInteractorOutput> output;

@end
