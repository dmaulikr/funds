//
//  AMFCashPlain.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFCashPlain.h"

@implementation AMFCashPlain

@synthesize descr,
date,
amount,
pos_lon,
pos_lat,
wallet2wallet,
wallet,
currency,
category,
page;

-(NSString*) description {
    return [NSString stringWithFormat:@"CASH Plain: %@ => description: %@, amount: %g",
            self.date,
            self.descr,
            self.amount];
}

@end
