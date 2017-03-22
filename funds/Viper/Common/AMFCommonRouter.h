//
//  AMFCommonRouter.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFSimpleAlertProtocol.h"

@protocol AMFSimpleAlertProtocol;

@interface AMFCommonRouter : NSObject<AMFSimpleAlertProtocol>

@property (nonatomic, strong) id<AMFSimpleAlertProtocol> alertFactory;

@end
