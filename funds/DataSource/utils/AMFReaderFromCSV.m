//
//  AMFReaderFromCSV.m
//  funds
//
//  Created by Michael on 10.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFReaderFromCSV.h"
#import "AMFBudgetCSVReader.h"
#import "AMFPlainBudgetData.h"
#import "AMFCashPlain.h"
#import "AMFWalletPlain.h"
#import "AMFCurrencyPlain.h"
#import "AMFCategoryPlain.h"
#import "AMFPagePlain.h"
#import "AMFPageProtocol.h"
#import "AMFStorageHandlerProtocol.h"

@interface AMFReaderFromCSV() {
    AMFBudgetCSVReader *_reader;
}

@end

@implementation AMFReaderFromCSV

@synthesize handler;

-(NSString *)applicationDocumentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = paths.firstObject;
    return basePath;
}

-(void)checkDocumentsFolderForFiles {
    NSString *docs = [self applicationDocumentsDirectory];
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *directoryContent = [fm contentsOfDirectoryAtPath:docs error:nil];
    NSString *file = nil;
    LogDebug(@"Try to find something in directory: '%@'", docs);
    for (NSString *f in directoryContent) {
        if ([f containsString:@".csv"]) {
            file = f;
            break;
        }
    }
    if (file && file.length) {
        LogDebug(@"file found: %@.. Try to read its contents", file);
        [self populateContentsWithFile:file];
        [fm removeItemAtPath:file error:nil];
    }
}

-(void)populateContentsWithFile:(NSString*)file {
    AMFBudgetCSVReader *reader = [[AMFBudgetCSVReader alloc] init];
    [reader readContentsOfCSVFile:file];
    LogDebug(@"Imported from file '%@' => %ld records...",
             file,
             (long)reader.contents.count);
    NSMutableArray* ar = [NSMutableArray arrayWithCapacity:reader.contents.count];
    for (AMFPlainBudgetData *rec in reader.contents) {
        AMFCashPlain *cash = [[AMFCashPlain alloc] init];
        AMFWalletPlain *wal = [[AMFWalletPlain alloc] init];
        AMFCategoryPlain *cat = [[AMFCategoryPlain alloc] init];
        AMFPagePlain *page = [[AMFPagePlain alloc] init];
        AMFCurrencyPlain *c = [[AMFCurrencyPlain alloc] init];

        wal.name = rec.wallet;
        page.name = rec.page;
        c.name = rec.currency;
        cat.name = rec.category;

        cash.date = rec.date;
        cash.descr = rec.descr;
        cash.amount = rec.amount;

        cash.wallet = wal;
        cash.currency = c;
        cash.category = cat;
        cash.page = page;

        if (rec.toWallet && rec.toWallet.length) {
            // moving money to another account
            AMFWalletPlain *walInto = [[AMFWalletPlain alloc] init];
            AMFCurrencyPlain *cInto = [[AMFCurrencyPlain alloc] init];
            AMFCashPlain *cashInto = [[AMFCashPlain alloc] init];

            walInto.name = rec.toWallet;

            cashInto.wallet2wallet = cash;
            cash.wallet2wallet = cashInto;

            cashInto.amount = rec.toWalletAmount;
            cashInto.date = rec.date;
            cashInto.descr = rec.descr;
            cInto.name = rec.toWalletCurrency;

            cashInto.currency = cInto;
            cashInto.wallet =  walInto;
            cashInto.category = cat;
            cashInto.page = page;
        }
        [ar addObject:cash];
    }
    [self.handler addRecords:ar];
}
@end
