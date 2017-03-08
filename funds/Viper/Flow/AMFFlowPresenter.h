//
//  AMFFlowPresenter.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFFlowViewOutput.h"

@protocol AMFFlowViewInput;
@protocol AMFFlowIteractorInput;
@protocol AMFFlowRouterInput;

@interface AMFFlowPresenter : NSObject<AMFFlowViewOutput>

@property (nonatomic, weak) id<AMFFlowViewInput> view;
@property (nonatomic, strong) id<AMFFlowIteractorInput> iteractor;
@property (nonatomic, strong) id<AMFFlowRouterInput> router;

@end
