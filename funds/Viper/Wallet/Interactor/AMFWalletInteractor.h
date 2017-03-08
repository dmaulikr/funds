//
//  AMFWalletInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFWalletInteractorInput.h"

@protocol AMFWalletInteractorOutput;

@interface AMFWalletInteractor : NSObject <AMFWalletInteractorInput>

@property (nonatomic, weak) id<AMFWalletInteractorOutput> output;

@end
