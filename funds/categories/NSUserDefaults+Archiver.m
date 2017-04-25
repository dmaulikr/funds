//
//  NSUserDefaults+Archiver.m
//  funds
//
//  Created by Michael on 25.04.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "NSUserDefaults+Archiver.h"

@implementation NSUserDefaults(Archiver)

- (void)persistObj:(id)value forKey:(NSString *)key {
    [self setObject:value  forKey:key];
    [self synchronize];
}

- (void)persistObjAsData:(id)encodableObject forKey:(NSString *)key {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:encodableObject];
    [self persistObj:data forKey:key];
}

- (id)objectFromDataWithKey:(NSString*)key {
    NSData *data = [self objectForKey:key];
    return [NSKeyedUnarchiver unarchiveObjectWithData:data];
}

@end
