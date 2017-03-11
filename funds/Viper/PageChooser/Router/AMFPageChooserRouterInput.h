//
//  AMFPageChooserRouterInput.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFPageProtocol;

@protocol AMFPageChooserRouterInput <NSObject>

/**
 closes page chooser
 */
-(void) closeDialog;


/**
 show up a dialog for page's selection
 */
-(void) showWithPageSelected:(id<AMFPageProtocol>)page;

@end
