//
//  AMFFlowModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 10/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFPageProtocol;

@protocol AMFFlowModuleInput <RamblerViperModuleInput>

/**
 page to be shown
 */
@property (nonatomic, strong) id<AMFPageProtocol> page;

/**
 Method initializes the module's configuration
 */
- (void)configureModule;

@end
