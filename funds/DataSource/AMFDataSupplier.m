//
//  AMFDataSupplier.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFDataSupplier.h"

@implementation AMFDataSupplier

-(void)fetchDataWithPage:(id<AMFPageCashProtocol>)page andBlock:(AMFDataSupplyBlock) block {
    NSArray *ar = nil;
    assert(block != nil);
    // @todo replace me!
    block(ar);
}
@end
