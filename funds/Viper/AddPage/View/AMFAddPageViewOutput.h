//
//  AMFAddPageViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFAddPageViewOutput <NSObject>

/**
 @author Michael Artuerhof

 Method says to the presenter what everything's ready for work
 */
- (void)didTriggerViewReadyEvent;


/**
 * done was touched
 */
- (void)doneWithPageName:(NSString*)pname;

@end
