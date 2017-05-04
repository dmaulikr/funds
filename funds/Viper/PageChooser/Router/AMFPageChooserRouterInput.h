//
//  AMFPageChooserRouterInput.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFAddPageModuleOutput;
@protocol AMFPageProtocol;

@protocol AMFPageChooserRouterInput <NSObject>

/**
 * closes page chooser
 */
- (void)closeDialog;


/**
 * opens an add page dialog
 */
- (void)openAddPageWithOutput:(id<AMFAddPageModuleOutput>)output;

/**
 * opens an edit page dialog
 */
- (void)openEditPageWithPage:(id<AMFPageProtocol>)page andOutput:(id<AMFAddPageModuleOutput>)output;

@end
