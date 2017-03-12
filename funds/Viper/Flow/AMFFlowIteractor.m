//
//  AMFFlowIteractor.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFFlowInteractor.h"
#import "AMFFlowInteractorOutput.h"
#import "AMFDataSupplyProtocol.h"
#import "AMFPageProtocol.h"
#import "AMFFlowData.h"
#import "AMFCashProtocol.h"
#import "AMFWalletProtocol.h"
#import "AMFCategoryProtocol.h"

@interface AMFFlowInteractor ()

@end

@implementation AMFFlowInteractor

-(NSArray<AMFFlowData*>*) convertRecords:(NSArray*) recs {
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
        } else {
            if (r.descr && r.descr.length)
                f.descr = r.descr;
            else
                f.descr = r.category.name;
            f.icon = r.category.icon_path;
            f.amount = [NSString stringWithFormat:@"%g", r.amount];
        }
        [converted addObject:f];
    }
    return converted;
}

-(void) askForDataWithPage:(id<AMFPageProtocol>) page {
    [self.dataSupply fetchDataWithPage:page andBlock: ^(NSArray *data) {
        LogDebug(@"we've got %ld record(s)", (long) data.count);
        NSArray* converted = [self convertRecords:data];
        dispatch_async(dispatch_get_main_queue(), ^ {
            [self.output receivedRecords:converted];
        });
    }];
}

-(void) askForAnyValidPage {
    [self.dataSupply fetchAllPagesWithBlock:^(NSArray *pages) {
        LogDebug(@"we've got %ld page(s)", (long) pages.count);
        if (pages.count) {
            dispatch_async(dispatch_get_main_queue(), ^ {
                [self.output receivedValidPage:pages.firstObject];
            });
        }
    }];
}

@end
