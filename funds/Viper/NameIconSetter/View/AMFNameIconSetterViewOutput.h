//
//  AMFNameIconSetterViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFNameIconSetterViewOutput <NSObject>

/**
 * tells the presenter that the view is ready for work
 */
- (void)didTriggerViewReadyEvent;

/**
 * category was edited
 */
- (void)doneEditingWithName:(NSString*)name andIcon:(NSString*)icon;

@end
