//
//  AMFNameIconSetterModuleOutput.h
//  funds
//
//  Created by Michael on 06.05.17.
//  Copyright © 2017 micartu. All rights reserved.
//


#import <Foundation/Foundation.h>
#import <ViperMcFlurry/ViperMcFlurry.h>

@protocol AMFNameIconSetterModuleOutput <RamblerViperModuleOutput>

- (void)editFinishedWithName:(NSString*)name andIcon:(NSString*)icon;

@end
