//
//  AMFPageChooserInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFPageProtocol;

@protocol AMFPageChooserInteractorInput <NSObject>

/**
 receives all availble pages
 */
- (void)receiveAllPages;

/**
 * delete a page please
 */
- (void)deletePage:(id<AMFPageProtocol>)page;

@end
