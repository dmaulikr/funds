//
//  AMFChooseCategoryInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFChooseCategoryInteractorInput.h"

@protocol AMFChooseCategoryInteractorOutput;

@interface AMFChooseCategoryInteractor : NSObject <AMFChooseCategoryInteractorInput>

@property (nonatomic, weak) id<AMFChooseCategoryInteractorOutput> output;

@end
