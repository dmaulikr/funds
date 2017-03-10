//
//  AMFDataSupplier.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFDataSupplier.h"
#import "AMFPageProtocol.h"
#import "AMFStorageHandlerProtocol.h"

@implementation AMFDataSupplier

-(void)fetchDataWithPage:(id<AMFPageProtocol>)page andBlock:(AMFDataSupplyBlock) block {
    assert(block != nil);
    block([self.handler grabRecordsForPage:page]);
}

-(void)fetchAllPagesWithBlock:(AMFDataSupplyBlock)block {
    assert(block != nil);
    block([self.handler grabAllPages]);
}

@end
