//
//  AMFAppDelegateCoreData.m
//  funds
//
//  Created by Michael Artuerhof on 25/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAppDelegateCoreData.h"
#import <MagicalRecord/MagicalRecord.h>

@implementation AMFAppDelegateCoreData

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"funds"];
    return YES;
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    [[NSManagedObjectContext MR_defaultContext] MR_saveToPersistentStoreWithCompletion:^(BOOL contextDidSave, NSError * _Nullable error) {
        if (contextDidSave) {
            LogDebug(@"Core Data Context saved");
        }
        else if (error) {
            LogDebug(@"Error saving context of Core Data: %@", error.description);
        }
    }];
}

@end
