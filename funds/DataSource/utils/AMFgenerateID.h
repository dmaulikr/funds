//
//  AMFgenerateID.h
//  funds
//
//  Created by Michael on 14.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AMFgenerateID : NSObject

-(instancetype) initWithID:(NSUInteger) idInit;
-(NSUInteger) generateID;

@end
