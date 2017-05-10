//
//  NSManagedObject+generateID.h
//  funds
//
//  Created by Michael on 15.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObject (generateID)

+ (NSUInteger)nextID:(NSString *)idKey
       forEntityName:(NSString *)entityName
           inContext:(NSManagedObjectContext *)context;

@end
