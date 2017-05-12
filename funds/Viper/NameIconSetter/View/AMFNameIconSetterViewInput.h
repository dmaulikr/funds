//
//  AMFNameIconSetterViewInput.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol AMFNameIconSetterViewInput <NSObject>

/**
 @author Michael Artuerhof

 sets initial state of the view
 */
- (void)setupInitialState;

/**
 * name to be displayed
 */
@property (nonatomic, strong) NSString *name;

/**
 * icon to be chosen
 */
@property (nonatomic, strong) NSString *icon;

/**
 * iconset
 */
@property (nonatomic, assign) NSInteger iconset;

/**
 * refreshes data shown to the user
 */
- (void)refreshContents;

/**
 * hides icon's chooser
 */
- (void)hideIconTable;

/**
 * changes the label of name
 */
- (void)changeNameLabel:(NSString*)name;

@end
