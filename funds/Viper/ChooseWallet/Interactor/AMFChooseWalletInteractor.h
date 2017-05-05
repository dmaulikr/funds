//
//  AMFChooseWalletInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseWalletInteractorInput.h"

@protocol AMFStorageHandlerProtocol;
@protocol AMFChooseWalletInteractorOutput;

@interface AMFChooseWalletInteractor : NSObject <AMFChooseWalletInteractorInput>


/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

@property (nonatomic, weak) id<AMFChooseWalletInteractorOutput> output;

@end
