//
//  AMFBalanceViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFBalanceViewOutput <NSObject>

/**
 @author Michael Artuerhof

 method tell the view is ready to work
 */
- (void)didTriggerViewReadyEvent;

/**
 * user wants next report
 */
- (void)nextReportButtonPressed;

/**
 * user wants previous report
 */
- (void)prevReportButtonPressed;

@end
