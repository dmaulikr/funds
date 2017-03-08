//
//  AMFFlowViewInput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFDataSupplyProtocol;
@protocol AMFCashPageProtocol;

@protocol AMFFlowViewInput <NSObject>

/**
 data source to be used for showing contents
 */
@property (nonatomic, strong) id<AMFDataSupplyProtocol> input;

/**
 what page should be viewed, could be also nil - then find the first or saved one
 */
//@property (nonatomic, strong) id<AMFCashPageProtocol> page;

@end
