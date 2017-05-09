//
//  AMFBalanceInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBalanceInteractor.h"

#import "AMFBalanceInteractorOutput.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFCashProtocol.h"
#import "AMFPageProtocol.h"
#import "AMFBalanceItem.h"

@interface AMFBalanceInteractor () {
    id<AMFPageProtocol> _page;
}
@end

@implementation AMFBalanceInteractor

#pragma mark - Methods of AMFBalanceInteractorInput

-(void)separateArray:(NSArray*)source
                          intoPositive:(NSMutableArray*)positive
                          negative:(NSMutableArray*)negative {
    for (AMFBalanceItem *i in source) {
        if (i.amount > 0) {
            [positive addObject:i];
        } else if (i.amount < 0) {
            [negative addObject:i];
        }
    }
}

- (id<AMFPageProtocol>)currentPage {
    if (!_page) {
        NSArray *pages = [self.storage grabAllPages];
        if (pages.count)
            _page = pages.firstObject;
    }
    return _page;
}

- (id<AMFPageProtocol>)prevPage {
    NSArray *pages = [self.storage grabAllPages];
    if (!_page && pages.count)
        _page = pages.firstObject;
    if (!_page)
        return nil;
    NSUInteger index = [pages indexOfObject:_page];
    if (index + 1 < pages.count) {
        return pages[index + 1];
    }
    return nil;
}

- (id<AMFPageProtocol>)nextPage {
    NSArray *pages = [self.storage grabAllPages];
    if (!_page && pages.count)
        _page = pages.firstObject;
    if (!_page)
        return nil;
    NSInteger index = [pages indexOfObject:_page];
    if (index - 1 >= 0) {
        return pages[index - 1];
    }
    return nil;
}

- (void)makeReportForPage:(id<AMFPageProtocol>)page {
    if (!page) {
        return;
    }

    _page = page;

    NSMutableArray *o = [[NSMutableArray alloc] init];
    NSArray *recs = [self.storage grabRecordsForPage:page];
    for (id<AMFCashProtocol> rec in recs) {
        AMFBalanceItem *item = nil;
        for (AMFBalanceItem *i in o) {
            if (i.category == rec.category) {
                item = i;
                break;
            }
        }

        if (item) {
            item.amount += rec.amount;
        } else {
            item = [[AMFBalanceItem alloc] initWithType:AMFBalanceItemTypeCategory];
            item.category = rec.category;
            item.amount = rec.amount;
            [o addObject:item];
        }
    }

    NSMutableArray *positive = [[NSMutableArray alloc] init];
    NSMutableArray *negative = [[NSMutableArray alloc] init];
    [self separateArray:o intoPositive:positive negative:negative];
    [o removeAllObjects];

    // calculate income and outcome:
    double temp = 0;
    for (AMFBalanceItem *i in positive) {
        temp += i.amount;
    }
    AMFBalanceItem *income = [[AMFBalanceItem alloc] initWithType:AMFBalanceItemTypeTotalAdditions];
    income.amount = temp;
    temp = 0;
    for (AMFBalanceItem *i in negative) {
        temp += i.amount;
    }
    AMFBalanceItem *loses = [[AMFBalanceItem alloc] initWithType:AMFBalanceItemTypeTotalLoses];
    loses.amount = temp;
    [positive addObject:income];
    [negative addObject:loses];

    // sort all data:
    [positive sortUsingComparator:^(AMFBalanceItem *i1, AMFBalanceItem *i2) {
        if (i1.amount > i2.amount) {
            return (NSComparisonResult)NSOrderedAscending;
        } else if (i1.amount < i2.amount) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];

    [negative sortUsingComparator:^(AMFBalanceItem *i1, AMFBalanceItem *i2) {
        if (fabs(i1.amount) > fabs(i2.amount)) {
            return (NSComparisonResult)NSOrderedAscending;
        } else if (fabs(i1.amount) < fabs(i2.amount)) {
            return (NSComparisonResult)NSOrderedDescending;
        }
        return (NSComparisonResult)NSOrderedSame;
    }];

    id<AMFPageProtocol> prev = [self prevPage];
    id<AMFPageProtocol> next = [self nextPage];

    [self.output availableDirectionsForLeft:prev ? prev.name : nil
                                   andRight:next ? next.name : nil];

    // put sorted elements back into out array
    [o addObjectsFromArray:positive];
    [o addObjectsFromArray:negative];

    [self.output reportCompleted:o];
}

@end
