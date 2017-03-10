//
//  AMFFlowViewInput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFFlowViewInput <NSObject>

/**
 records themselves
 */
@property (nonatomic, strong) NSArray *records;

/**
 setups initial state of the view
 */
- (void)setupInitialState;

/**
 refreshes data shown to the user
 */
- (void)refreshContents;

/**
 sets title of navigation controller
 */
- (void)setTitle:(NSString*) title;

@end
