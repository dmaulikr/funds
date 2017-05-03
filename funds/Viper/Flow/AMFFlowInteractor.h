//
//  AMFFlowInteractor.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMFFlowInteractorInput.h"

@protocol AMFStorageHandlerProtocol;
@protocol AMFFlowInteractorOutput;

@interface AMFFlowInteractor : NSObject<AMFFlowInteractorInput>

/// through the property we'll get access to data storage
@property (nonatomic, strong) id<AMFStorageHandlerProtocol> storage;

/**
 presenter's link
 */
@property (nonatomic, weak) id<AMFFlowInteractorOutput> output;

@end
