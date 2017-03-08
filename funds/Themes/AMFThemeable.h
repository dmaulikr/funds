//
//  AMFThemeable.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMFTheme;

/**
 @author Michael Artuerhof
 
 interface for themeable views
 */
@protocol AMFThemeable <NSObject>

/**
 theme used for customization of the view
 */
@property(nonatomic, strong) AMFTheme *theme;

/**
 should be called in the moment the theme (set in property theme) must be applied to the view
 */
- (void)applyTheme;

@end
