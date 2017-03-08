//
//  AMFDataSupply.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFPageCashProtocol;
@protocol AMFCashProtocol;

typedef void(^AMFDataSupplyBlock)(NSArray *data);

@protocol AMFDataSupplyProtocol <NSObject>

-(void)fetchDataWithPage:(id<AMFPageCashProtocol>)page andBlock:(AMFDataSupplyBlock) block;

@end
