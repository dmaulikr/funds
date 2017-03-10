//
//  AMFDataSupply.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFPageProtocol;
@protocol AMFCashProtocol;

typedef void(^AMFDataSupplyBlock)(NSArray *data);

@protocol AMFDataSupplyProtocol <NSObject>

/**
 needed for fetching data from storage and giving it back to the client
 */
-(void)fetchDataWithPage:(id<AMFPageProtocol>)page andBlock:(AMFDataSupplyBlock) block;

/**
 fetch all records with pages
 */
-(void)fetchAllPagesWithBlock:(AMFDataSupplyBlock)block;

@end
