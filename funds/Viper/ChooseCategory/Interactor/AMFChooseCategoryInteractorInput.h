//
//  AMFChooseCategoryInteractorInput.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFCategoryProtocol;

@protocol AMFChooseCategoryInteractorInput <NSObject>

/**
 receives all availble categories
 */
- (void)receiveAllCategories;

/**
 * changes the category
 */
- (void)changeCategory:(id<AMFCategoryProtocol>)category
              withName:(NSString*)name
               andIcon:(NSString*)icon;

/**
 * creates a category
 */
- (void)createCategoryWithName:(NSString*)name
                       andIcon:(NSString*)icon;
@end
