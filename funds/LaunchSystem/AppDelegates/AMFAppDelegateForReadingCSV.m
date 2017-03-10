//
//  AMFAppDelegateForReadingCSV.m
//  funds
//
//  Created by Michael on 10.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAppDelegateForReadingCSV.h"
#import "AMFFileIntoDBReader.h"

@implementation AMFAppDelegateForReadingCSV

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // check if we've got any csv files
    [self.csvReader checkDocumentsFolderForFiles];
    return YES;
}
@end
