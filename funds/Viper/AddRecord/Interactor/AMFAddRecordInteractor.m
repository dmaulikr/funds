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
#import "AMFWalletProtocol.h"
#import "AMFWalletPlain.h"
#import "AMFCashPlain.h"
#import "AMFCategoryPlain.h"
#import "NSUserDefaults+Archiver.h"
#import "GlobalConstants.h"

@interface AMFAddRecordInteractor () {
    id<AMFCategoryProtocol> _category;
    id<AMFWalletProtocol> _wallet;
    id<AMFWalletProtocol> _wwallet;
}
@end

@implementation AMFAddRecordInteractor

#pragma mark - Methods of AMFAddRecordInteractorInput

- (void)addRecordWithAmount:(double)amount andDescription:(NSString*)descr {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (!_category) {
        _category = [defaults objectFromDataWithKey:kLastCategory];
        if (!_category) { // create a new one
            _category = [[AMFCategoryPlain alloc] init];
            _category.name = @"?";
            [defaults persistObjAsData:_category forKey:kLastCategory];
        }
    }
    
    if (!_wallet) { // find one
        _wallet = [defaults objectFromDataWithKey:kLastWallet];
        if (!_wallet) { // create a new one
            _wallet = [[AMFWalletPlain alloc] init];
            _wallet.name = @"?";
            [defaults persistObjAsData:_wallet forKey:kLastWallet];
        }
    }
    
    AMFCashPlain *cash = [[AMFCashPlain alloc] init];
    cash.amount = amount;
    cash.descr = descr;
    cash.pos_lat = 0; // TODO: add a location
    cash.pos_lon = 0; // TODO: add a location
    cash.date = [NSDate date];
    
    [self.storage addRecord:cash];
    [self.output recordCreatedWithError:nil];
}

- (void)selectedCategory:(id<AMFCategoryProtocol>)category {
    _category = category;
}

- (void)selectedWallet:(id<AMFWalletProtocol>)wallet {
    _wallet = wallet;
}

- (void)withdrawalWallet:(id<AMFWalletProtocol>)wallet {
    _wwallet = wallet;
}

@end
