//
//  AMFAddPageInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageInteractorInput.h"

@protocol AMFAddPageInteractorOutput;

@interface AMFAddPageInteractor : NSObject <AMFAddPageInteractorInput>

@property (nonatomic, weak) id<AMFAddPageInteractorOutput> output;

@end
