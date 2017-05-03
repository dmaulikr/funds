//
//  AMFAddPageViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFPageProtocol;

@protocol AMFAddPageViewOutput <NSObject>

/**
 @author Michael Artuerhof

 Method says to the presenter what everything's ready for work
 */
- (void)didTriggerViewReadyEvent;

/**
 * update an existing page
 */
- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString*)pname;

/**
 * create a new page
 */
- (void)createNewWithPageName:(NSString*)pname;

@end
