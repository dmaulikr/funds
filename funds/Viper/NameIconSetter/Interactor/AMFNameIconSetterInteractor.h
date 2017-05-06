//
//  AMFNameIconSetterInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFNameIconSetterInteractorInput.h"

@protocol AMFNameIconSetterInteractorOutput;

@interface AMFNameIconSetterInteractor : NSObject <AMFNameIconSetterInteractorInput>

@property (nonatomic, weak) id<AMFNameIconSetterInteractorOutput> output;

@end
