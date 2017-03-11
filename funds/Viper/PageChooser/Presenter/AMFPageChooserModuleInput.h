//
//  AMFPageChooserModuleInput.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFPageProtocol;
@protocol AMFPageChooserModuleInput <RamblerViperModuleInput>

/**
 module's input - shows a dialog for page selection
 */
- (void)configureModuleWithPageSelected:(id<AMFPageProtocol>)page;

@end
