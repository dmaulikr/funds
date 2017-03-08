//
//  AMFBalanceInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceInteractorInput.h"

@protocol AMFBalanceInteractorOutput;

@interface AMFBalanceInteractor : NSObject <AMFBalanceInteractorInput>

@property (nonatomic, weak) id<AMFBalanceInteractorOutput> output;

@end
