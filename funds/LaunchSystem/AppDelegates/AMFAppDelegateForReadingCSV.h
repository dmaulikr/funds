//
//  AMFAppDelegateForReadingCSV.h
//  funds
//
//  Created by Michael on 10.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AMFFileIntoDBReader;

@interface AMFAppDelegateForReadingCSV : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) id<AMFFileIntoDBReader> csvReader;

@end
