//
//  NSUserDefaults+Archiver.h
//  funds
//
//  Created by Michael on 25.04.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaults (Archiver)

/**
 * serializes object and saves it
 */
- (void)persistObjAsData:(id)encodableObject forKey:(NSString *)key;

/**
 * deserializes object and gives it back
 */
- (id)objectFromDataWithKey:(NSString*)key;

@end
