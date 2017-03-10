//
//  AMFDataSupplier.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFDataSupplier.h"
#import "AMFBudgetCSVReader.h"
#import "AMFPlainBudgetData.h"
#import "AMFCashPlain.h"
#import "AMFWalletPlain.h"
#import "AMFCurrencyPlain.h"
#import "AMFCategoryPlain.h"

@interface AMFDataSupplier() {
    AMFBudgetCSVReader *_reader;
}

@end

@implementation AMFDataSupplier

-(void)fetchDataWithPage:(id<AMFPageCashProtocol>)page andBlock:(AMFDataSupplyBlock) block {
    NSArray *ar = nil;
    assert(block != nil);
    // @todo replace me!
    block(ar);
}

-(NSString *)applicationDocumentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = paths.firstObject;
    return basePath;
}

-(void)checkDocumentsFolderForCSV {
    NSString *docs = [self applicationDocumentsDirectory];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *directoryContent = [fm contentsOfDirectoryAtPath:docs error:nil];
    NSString *file = nil;
    for (NSString *f in directoryContent) {
        if ([f containsString:@".csv"]) {
            file = f;
            break;
        }
    }
    if (file && file.length) {
        [self populateContentsWithCSVFile:file];
        [fm removeItemAtPath:file error:nil];
    }
}

-(void)populateContentsWithCSVFile:(NSString*)file {
    AMFBudgetCSVReader *reader = [[AMFBudgetCSVReader alloc] init];
    [reader readContentsOfCSVFile:file];
    NSMutableArray* ar = [NSMutableArray arrayWithCapacity:reader.contents.count];
    for (AMFPlainBudgetData *rec in reader.contents) {
        AMFCashPlain *cash = [[AMFCashPlain alloc] init];
        AMFWalletPlain *wal = [[AMFWalletPlain alloc] init];
        AMFCategoryPlain *cat = [[AMFCategoryPlain alloc] init];
        wal.name = rec.wallet;
        cash.date = rec.date;
        cash.wallet = wal;
        cash.descr = rec.descr;
        cash.amount = rec.amount;
        AMFCurrencyPlain *c = [[AMFCurrencyPlain alloc] init];
        c.name = rec.currency;
        cash.currency = c;
        cat.name = rec.category;
        cash.category = cat;
        if (rec.toWallet && rec.toWallet.length) {
            // moving money to another account
            AMFWalletPlain *walInto = [[AMFWalletPlain alloc] init];
            AMFCurrencyPlain *cInto = [[AMFCurrencyPlain alloc] init];
            walInto.name = rec.toWallet;
            AMFCashPlain *cashInto = [[AMFCashPlain alloc] init];
            cashInto.wallet2wallet = cash;
            cash.wallet2wallet = cashInto;
            cashInto.amount = rec.toWalletAmount;
            cashInto.wallet =  walInto;
            cashInto.category = cat;
            cashInto.date = rec.date;
            cashInto.descr = rec.descr;
            cInto.name = rec.toWalletCurrency;
            cashInto.currency = cInto;
        }
        [ar addObject:cash];
    }
    [self.handler addRecords:ar];
}
@end
