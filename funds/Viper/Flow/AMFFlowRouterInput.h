//
//  AMFFlowRouterInput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAlertProtocol.h"

@protocol AMFPageProtocol;
@protocol AMFPageChooserModuleOutput;
@protocol AMFAddRecordModuleOutput;
@protocol AMFSimpleAlertProtocol;

@protocol AMFFlowRouterInput <AMFAlertProtocol>

/**
 show up a dialog for page's selection
 */
-(void) showPageChooserWithPageSelected:(id<AMFPageProtocol>)page
                              andOutput:(id<AMFPageChooserModuleOutput>) output;

/**
 opens an add dialog window
 */
-(void) showAddRecordWithOutput:(id<AMFAddRecordModuleOutput>)output;

@end
