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
@protocol AMFDataSupplyProtocol;

@interface AMFFlowInteractor : NSObject<AMFFlowInteractorInput>

/**
 data source to be used for showing contents
 */
@property (nonatomic, strong) id<AMFDataSupplyProtocol> dataSupply;

/**
 presenter's link
 */
@property (nonatomic, weak) id<AMFFlowInteractorOutput> output;

@end
