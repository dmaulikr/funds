//
//  AMFAddRecordModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFAddRecordModuleInput <RamblerViperModuleInput>

/**
 @author Michael Artuerhof

 Method initializes the starting configuration of the module
 */
- (void)configureModule;

@end
