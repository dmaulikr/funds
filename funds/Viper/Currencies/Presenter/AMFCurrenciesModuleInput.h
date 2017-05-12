//
//  AMFCurrenciesModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFCurrenciesModuleInput <RamblerViperModuleInput>

/**
 @author Michael Artuerhof

 Method initializes the starting configuration of the module
 */
- (void)configureModule;

@end
