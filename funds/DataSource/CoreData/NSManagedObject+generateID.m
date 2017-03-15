//
//  NSManagedObject+generateID.m
//  funds
//
//  Created by Michael on 15.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "NSManagedObject+generateID.h"

@implementation NSManagedObject (generateID)

+(NSUInteger) nextID:(NSString *)idKey forEntityName:(NSString *)entityName inContext:(NSManagedObjectContext *)context{
    NSEntityDescription *entity = [NSEntityDescription entityForName:entityName
                                              inManagedObjectContext:context];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];

    [fetchRequest setResultType:NSDictionaryResultType];
    [fetchRequest setPropertiesToFetch:[NSArray arrayWithObject:idKey]];

    NSError *error = nil;
    NSArray *existingIDs = [context executeFetchRequest:fetchRequest error:&error];

    if (error != nil) {
        NSLog(@"nextID => Error: %@", [error localizedDescription]);
        return 0;
    }

    NSInteger newID = 0;
    for (NSDictionary *dict in existingIDs) {
        NSInteger IDToCompare = [[dict valueForKey:idKey] integerValue];

        if (IDToCompare >= newID)
            newID = IDToCompare + 1;
    }
    return newID;
}

@end
