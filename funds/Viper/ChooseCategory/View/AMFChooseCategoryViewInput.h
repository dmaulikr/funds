//
//  AMFChooseCategoryViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCategoryProtocol;

@protocol AMFChooseCategoryViewInput <NSObject>

/**
 @author Michael Artuerhof

 sets initial state of the view
 */
- (void)setupInitialState;

/**
 categories to be shown
 */
@property (nonatomic, strong) NSArray *categories;

/**
 what's already selected
 */
@property (nonatomic, strong) id<AMFCategoryProtocol> selectedCategory;

/**
 refreshes data shown to the user
 */
- (void)refreshContents;

@end
