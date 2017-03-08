//
//  AMFFlowInteractor.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMFFlowInteractorInput.h"

@protocol AMFFlowInteractorOutput;

@interface AMFFlowInteractor : NSObject<AMFFlowInteractorInput>

@property (nonatomic, weak) id<AMFFlowInteractorOutput> output;

@end
