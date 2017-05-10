//
//  AMFPlainBudgetData.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPlainBudgetData.h"

@implementation AMFPlainBudgetData

- (NSString *)description {
    return [NSString stringWithFormat:@"Budget DATA: %@ => description: %@, amount: %g",
            self.date,
            self.descr,
            self.amount];
}

@end
