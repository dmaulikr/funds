//
//  AMFChooseCategoryViewOutput.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFCategoryProtocol.h"

@protocol AMFChooseCategoryViewOutput <NSObject>

/**
 @author Michael Artuerhof

 tells the presenter that the view is ready for work
 */
- (void)didTriggerViewReadyEvent;

/**
 * which category was selected
 */
- (void)categorySelected:(id<AMFCategoryProtocol>)category;

/**
 * edit that category
 */
- (void)editCategory:(id<AMFCategoryProtocol>)category;

@end
