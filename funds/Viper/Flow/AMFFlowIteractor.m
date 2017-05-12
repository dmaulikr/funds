//
//  AMFFlowIteractor.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowInteractor.h"
#import "AMFFlowInteractorOutput.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFPageProtocol.h"
#import "AMFFlowData.h"
#import "AMFCashProtocol.h"
#import "AMFWalletProtocol.h"
#import "AMFCurrencyProtocol.h"
#import "AMFCategoryProtocol.h"

@interface AMFFlowInteractor () {
    NSArray<AMFFlowData*> *_records;
}
@end

@implementation AMFFlowInteractor

- (NSArray<AMFFlowData*>*)convertRecords:(NSArray*)recs {
    NSMutableArray *used = [[NSMutableArray alloc] initWithCapacity:recs.count];
    NSMutableArray *converted = [[NSMutableArray alloc] initWithCapacity:recs.count];
    for (id<AMFCashProtocol> r in recs) {
        if ([used containsObject:r]) // skip doubles
            continue;
        AMFFlowData *f = [[AMFFlowData alloc] init];
        if (r.wallet2wallet) {
            NSString *wLeft = r.wallet.name;
            NSString *wRight = r.wallet2wallet.wallet.name;
            BOOL takenFromLeft = r.amount < 0 ? YES : NO;
            NSString *from = [NSString stringWithFormat:@"%@->%@",
                              takenFromLeft ? wLeft : wRight,
                              takenFromLeft ? wRight : wLeft];
            f.descr = from;
            f.icon = @"exchange";
            f.amount = [NSString stringWithFormat:@"%g", fabs(r.amount)];
            [used addObject:r.wallet2wallet];
            f.realRecords = [NSArray arrayWithObjects:r, r.wallet2wallet, nil];
        } else {
            if (r.descr && r.descr.length)
                f.descr = r.descr;
            else
                f.descr = r.category.name;
            if (r.category.icon_path.length)
                f.icon = r.category.icon_path;
            else
                f.icon = @"help";
            f.amount = [NSString stringWithFormat:@"%g", r.amount];
            f.realRecords = [NSArray arrayWithObjects:r, nil];
        }
        if (r.currency) {
            if (r.currency.symbol.length) {
                f.currency = r.currency.symbol;
            }
            else {
                if (r.currency.name.length > 1) {
                    NSRange range = NSMakeRange(0, 1);
                    f.currency = [r.currency.name substringWithRange:range];
                }
                else
                    f.currency = r.currency.name;
            }
        }
        [converted addObject:f];
    }
    return converted;
}

- (void)askForDataWithPage:(id<AMFPageProtocol>)page {
    NSArray *flow = [self.storage grabRecordsForPage:page];
    _records = [self convertRecords:flow];
    [self.output receivedRecords:_records];
}

- (void)askForAnyValidPage {
    NSArray *pages = [self.storage grabAllPages];
    if (pages.count)
        [self.output receivedValidPage:pages.firstObject];
}

- (void)removeCashFlowWithIndex:(NSInteger)index {
    NSArray *recs = _records[index].realRecords;
    for (id<AMFCashProtocol> rec in recs) {
        [self.storage removeRecord:rec];
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:kEventRecordRemoved
                                                        object:nil];
}

- (id<AMFCashProtocol>)cashFlowWithIndex:(NSInteger)index {
    NSArray *recs = _records[index].realRecords;
    if (recs.count)
        return recs.firstObject;
    return nil;
}

@end
