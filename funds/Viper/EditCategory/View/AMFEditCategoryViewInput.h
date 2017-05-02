//
//  AMFEditCategoryViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol AMFCategoryProtocol;

@protocol AMFEditCategoryViewInput <NSObject>

/**
 @author Michael Artuerhof

 sets initial state of the view
 */
- (void)setupInitialState;

/**
 * category being edited
 */
@property (nonatomic, strong) id<AMFCategoryProtocol> category;

/**
 * refreshes data shown to the user
 */
- (void)refreshContents;

@end
