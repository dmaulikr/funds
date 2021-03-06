//
//  AMFWalletViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFWalletViewInput <NSObject>

/**
 @author Michael Artuerhof

 Метод настраивает начальный стейт view
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
