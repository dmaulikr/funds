//
//  AMFAddRecordInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddRecordInteractor.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFAddRecordInteractorOutput.h"
#import "AMFCategoryProtocol.h"
#import "AMFCurrencyProtocol.h"
#import "AMFWalletProtocol.h"
#import "AMFPageProtocol.h"
#import "AMFWalletPlain.h"
#import "AMFCashPlain.h"
#import "AMFCurrencyPlain.h"
#import "AMFCategoryPlain.h"
#import "AMFCashProtocol.h"

@interface AMFAddRecordInteractor () {
    id<AMFCurrencyProtocol> _currency;
    id<AMFCategoryProtocol> _category;
    id<AMFWalletProtocol> _wallet;
    id<AMFWalletProtocol> _wwallet;
    id<AMFPageProtocol> _page;
    id<AMFCashProtocol> _cash;
}
@end

@implementation AMFAddRecordInteractor

#pragma mark - Methods of AMFAddRecordInteractorInput

- (void)addRecordWithAmount:(double)amount andDescription:(NSString*)descr {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (!_category) {
        _category = [defaults objectFromDataWithKey:kLastCategory];
        if (!_category)
            _category = [self currentCategory];
    }

    if (!_wallet) { // find one
        _wallet = [defaults objectFromDataWithKey:kLastWallet];
        if (!_wallet)
            _wallet = [self currentWallet];
    }

    if (!_page) {
        _page = [defaults objectFromDataWithKey:kLastPage];
        if (!_page) { // create one
            // TODO add me
        }
    }

    AMFCashPlain *cash = [[AMFCashPlain alloc] init];
    cash.amount = amount;
    cash.descr = descr;
    cash.pos_lat = 0; // TODO: add a location
    cash.pos_lon = 0; // TODO: add a location
    cash.date = [NSDate date];
    cash.page = _page;
    cash.wallet = _wallet;
    cash.category = _category;
    cash.currency = [self currentCurrency];

    [self.storage addRecord:cash];
    [self.output recordCreatedWithError:nil];
}

- (void)setCashForEdit:(id<AMFCashProtocol>)cash {
    _cash = cash;
    _page = cash.page;
    _wallet = cash.wallet;
    _category = cash.category;
    _currency = cash.currency;
    _wwallet = cash.wallet2wallet.wallet;
}

- (void)updateRecordWithAmount:(double)amount andDescription:(NSString*)descr {
    id<AMFCashProtocol> cash = [self.storage findCashInStorage:_cash];
    if (cash) {
        cash.descr = descr;
        cash.page = _page;
        cash.wallet = _wallet;
        cash.category = _category;
        cash.currency = [self currentCurrency];
        [self.storage updateRecord:cash withAmount:amount];
        [self.output recordCreatedWithError:nil];
    } else {
        NSError *er = [NSError errorWithDomain:kDomain
                                          code:-1
                                      userInfo:@{@"msg" : AMFLocalize(@"No Record in DB")}];
        [self.output recordCreatedWithError:er];
    }
}

- (void)selectedCategory:(id<AMFCategoryProtocol>)category {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _category = category;
    [defaults persistObjAsData:_category forKey:kLastCategory];
}

- (void)selectedWallet:(id<AMFWalletProtocol>)wallet {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    _wallet = wallet;
    [defaults persistObjAsData:_wallet forKey:kLastWallet];
}

- (void)selectedCurrency:(id<AMFCurrencyProtocol>)currency {
    _currency = currency;
}

- (void)withdrawalWallet:(id<AMFWalletProtocol>)wallet {
    _wwallet = wallet;
}

- (id<AMFWalletProtocol>)currentWallet {
    if (!_wallet) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        _wallet = [defaults objectFromDataWithKey:kLastWallet];
        if (!_wallet) { // create a new one
            _wallet = [[AMFWalletPlain alloc] init];
            _wallet.name = @"?";
        }
        [defaults persistObjAsData:_wallet forKey:kLastWallet];
    }
    return _wallet;
}

- (id<AMFCategoryProtocol>)currentCategory {
    if (!_category) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        _category = [defaults objectFromDataWithKey:kLastCategory];
        if (!_category) { // create a new one
            _category = [[AMFCategoryPlain alloc] init];
            _category.name = @"?";
        }
        [defaults persistObjAsData:_category forKey:kLastCategory];
    }
    return _category;
}

- (id<AMFCurrencyProtocol>)nextCurrency {
    NSArray *curs = [self.storage grabAllCurrencies];
    if (_currency) {
        BOOL next = NO;
        for (id<AMFCurrencyProtocol> cur in curs) {
            if (next) {
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                _currency = cur;
                [defaults persistObjAsData:_currency forKey:kLastCurrency];
                return cur;
            }
            if ([cur.name isEqualToString:_currency.name]) {
                next = YES;
            }
        }
    }
    if (curs.count)
        return curs.firstObject;
    return nil;
}

- (id<AMFCurrencyProtocol>)currentCurrency {
    if (!_currency) {
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        _currency = [defaults objectFromDataWithKey:kLastCurrency];
        if (!_currency) {
            NSArray *curs = [self.storage grabAllCurrencies];
            BOOL found = NO;
            if (curs.count) {
                for (id<AMFCurrencyProtocol> cur in curs) {
                    if (cur.name.length) {
                        _currency = cur;
                        found = YES;
                        break;
                    }
                }
            }

            if (!found) {
                _currency = [[AMFCurrencyPlain alloc] init];
                _currency.name = @"?";
                _currency.rate = 1.0;
                _currency.symbol = @"?";
            }

            [defaults persistObjAsData:_currency forKey:kLastCurrency];
        }
    }
    return _currency;
}

@end
