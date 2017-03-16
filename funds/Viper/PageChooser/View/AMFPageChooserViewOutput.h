//
//  AMFPageChooserViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFPageChooserViewOutput <NSObject>

/**
 view is ready for work
 */
- (void)didTriggerViewReadyEvent;

/**
 user selected a cell with index
 */
- (void)cellSelected: (NSUInteger) index;

@end