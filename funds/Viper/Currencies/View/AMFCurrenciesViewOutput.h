//
//  AMFCurrenciesViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCurrenciesViewOutput <NSObject>

/**
 @author Michael Artuerhof

 tells the presenter that the view is ready for work
 */
- (void)didTriggerViewReadyEvent;

/**
 * called on viewWillAppear
 */
- (void)updateDataBeforeViewWillAppear;

/**
 * a cell with a given number was selected
 */
- (void)cellSelected:(NSUInteger)index;

@end
