//
//  AMFFlowRouterInput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFPageProtocol;
@protocol AMFPageChooserModuleOutput;

@protocol AMFFlowRouterInput <NSObject>

/**
 show up a dialog for page's selection
 */
-(void) showPageChooserWithPageSelected:(id<AMFPageProtocol>)page
                              andOutput:(id<AMFPageChooserModuleOutput>) output;

@end
