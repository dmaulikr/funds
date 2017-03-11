//
//  AMFPageChooserViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFPageProtocol;

@protocol AMFPageChooserViewInput <NSObject>

/**
 what's already selected
 */
@property (nonatomic, strong) id<AMFPageProtocol> selectedPage;

/**
 pages to be shown
 */
@property (nonatomic, strong) NSArray *pages;

/**
 refreshes data shown to the user
 */
- (void)refreshContents;

/**
 Метод настраивает начальный стейт view
 */
- (void)setupInitialState;


@end
