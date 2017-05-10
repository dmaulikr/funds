//
//  AMFBudgetCSVReader.h
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMFPlainBudgetData;

@interface AMFBudgetCSVReader : NSObject

- (void)readContentsOfCSVFile:(NSString *)file;

@property (nonatomic, strong) NSArray <AMFPlainBudgetData *> *contents;

@end
