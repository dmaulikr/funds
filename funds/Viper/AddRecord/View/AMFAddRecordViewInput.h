//
//  AMFAddRecordViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AMFCategoryProtocol.h"

@protocol AMFAddRecordViewInput <NSObject>

/**
 @author Michael Artuerhof

 sets initial state of the view
 */
- (void)setupInitialState;

/**
 * setups additional elements of the view
 */
- (void)setupView;

/// which category was selected
@property (nonatomic, strong) id<AMFCategoryProtocol> selectedCategory;

@end
