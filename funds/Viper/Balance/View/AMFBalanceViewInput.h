//
//  AMFBalanceViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFBalanceViewInput <NSObject>

/**
 @author Michael Artuerhof

 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;

/**
 * what to show
 */
@property (nonatomic, strong) NSArray *records;

/**
 refreshes data shown to the user
 */
- (void)refreshContents;

/**
 * names to be shown on upper panel
 */
- (void)setNamesOfUpperButtons:(NSString*)left andRight:(NSString*)right;

/**
 * title
 */
- (void)setCurrentPageTitle:(NSString*)title;

@end
