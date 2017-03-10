//
//  AMFFlowViewController.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ViperMcFlurry/ViperMcFlurry.h>
#import "AMFFlowViewInput.h"
#import "AMFThemeable.h"

@protocol AMFFlowViewOutput;
@class AMFTheme;
@class AMFFlowModuleAssembly;

@interface AMFFlowViewController : UIViewController <AMFFlowViewInput>

/**
 theme to be applied to the view
 */
@property (nonatomic, strong) AMFTheme *theme;

/**
 What should be passed over to presenter
 */
@property (nonatomic, strong) id<AMFFlowViewOutput> output;

/**
 needed for cells to be able to install themes
 */
@property (nonatomic, strong) AMFFlowModuleAssembly *assembly;

@end
