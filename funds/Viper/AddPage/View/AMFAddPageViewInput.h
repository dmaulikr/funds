//
//  AMFAddPageViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFPageProtocol.h"

@protocol AMFAddPageViewInput <NSObject>

/**
 @author Michael Artuerhof

 Method initializes the state
 */
- (void)setupInitialState;

/// show page's info
@property (nonatomic, strong) id<AMFPageProtocol> page;

@end
