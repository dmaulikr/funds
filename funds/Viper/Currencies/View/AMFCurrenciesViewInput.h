//
//  AMFCurrenciesViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCurrenciesViewInput <NSObject>

/**
 @author Michael Artuerhof

 sets initial state of the view
 */
- (void)setupInitialState;

/**
 * refreshes data shown to the user
 */
- (void)refreshContents;

/**
 * what to show
 */
@property (nonatomic, strong) NSArray *records;

@end
