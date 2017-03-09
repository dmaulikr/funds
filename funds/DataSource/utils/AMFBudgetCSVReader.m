//
//  AMFBudgetCSVReader.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFBudgetCSVReader.h"
#import <CHCSVParser/CHCSVParser.h>
#import "AMFPlainBudgetData.h"

@interface AMFBudgetCSVReader() <CHCSVParserDelegate> {
    AMFPlainBudgetData *_curData;
    NSMutableArray *_arr;
    NSDateFormatter *_dateFormatter;
}

@end

@implementation AMFBudgetCSVReader

-(instancetype) init {
    self = [super init];
    if (self) {
        _dateFormatter = [[NSDateFormatter alloc] init];
        [_dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
    }
    return self;
}

-(void)readContentsOfCSVFile:(NSString*)file {
    NSStringEncoding encoding = 0;
    NSInputStream *stream = [NSInputStream inputStreamWithFileAtPath:file];
    CHCSVParser *p = [[CHCSVParser alloc] initWithInputStream:stream usedEncoding:&encoding delimiter:','];
    [p setRecognizesBackslashesAsEscapes:YES];
    [p setSanitizesFields:YES];
    p.delegate = self;
    [p parse];
}

#pragma mark - csv parser methods

- (void)parserDidBeginDocument:(CHCSVParser *)parser {
    _arr = [[NSMutableArray alloc] init];
}

- (void)parser:(CHCSVParser *)parser didBeginLine:(NSUInteger)recordNumber {
    _curData = [[AMFPlainBudgetData alloc] init];
}

- (void)parser:(CHCSVParser *)parser didReadField:(NSString *)field
       atIndex:(NSInteger)fieldIndex {
    assert(_curData);
    assert(_dateFormatter);
    switch (fieldIndex) {
        case 2: // date
            _curData.date = [_dateFormatter dateFromString:field];
            break;
            
        case 4: // name of category
            _curData.category = field;
            break;
            
        case 5: // name of page
            _curData.page = field;
            break;
            
        case 6: // description
            _curData.descr = field;
            break;
            
        case 7: // name of wallet
            _curData.wallet = field;
            break;
            
        case 8:
            _curData.currency = field;
            break;
            
        case 9:
            _curData.amount = [field doubleValue];
            break;
            
        case 10:
            _curData.toWallet = field;
            break;
            
        case 11:
            _curData.toWalletCurrency = field;
            break;
            
        case 12:
            _curData.toWalletAmount = [field doubleValue];
            break;
            
        default: // an unneeded field
            break;
    }
}

- (void)parser:(CHCSVParser *)parser didEndLine:(NSUInteger)recordNumber {
    [_arr addObject:_curData];
}

- (void)parserDidEndDocument:(CHCSVParser *)parser {
    self.contents = _arr;
    _arr = nil;
}

- (void)parser:(CHCSVParser *)parser didFailWithError:(NSError *)error {
    LogDebug(@"ERROR: %@", error);
}

@end
