//
//  AMFCashFlow+CoreDataProperties.m
//  
//
//  Created by Michael on 09.03.17.
//
//  This file was automatically generated and should not be edited.
//

#import "AMFCashFlow+CoreDataProperties.h"

@implementation AMFCashFlow (CoreDataProperties)

+ (NSFetchRequest<AMFCashFlow *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"AMFCashFlow"];
}

@dynamic amount;
@dynamic date;
@dynamic descr;
@dynamic pos_lat;
@dynamic pos_lon;
@dynamic wallet;
@dynamic category;
@dynamic currency;
@dynamic page;
@dynamic wallet2wallet;


-(void) updateWith:(id<AMFCashProtocol>)cash {
    self.amount = cash.amount;
    self.descr = cash.descr;
    self.date = cash.date;
    self.pos_lat = cash.pos_lat;
    self.pos_lon = cash.pos_lon;
    self.wallet = [AMFWallet findOrCreateWithWallet:cash.wallet
                                            andCash:self];
    self.category = [AMFCategory findOrCreateWithCategory:cash.category
                                                  andCash:self];
    self.page = [AMFPage findOrCreateWithPage:cash.page andCash:self];
    self.currency = [AMFCurrency findOrCreateWithPage:cash.currency andCash:self];
}
@end
