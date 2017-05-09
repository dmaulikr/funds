//
//  AMFBalanceInteractorOutput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFBalanceInteractorOutput <NSObject>

/**
 * returns object to be shown for view
 */
- (void)reportCompleted:(NSArray*)report;

/**
 * shows which names should be shown on the buttons
 */
- (void)availableDirectionsForLeft:(NSString*)left andRight:(NSString*)right;

@end
