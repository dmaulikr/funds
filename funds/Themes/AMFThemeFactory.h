//
//  AMFThemeFactory.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMFTheme;

extern NSString * const kThemeChanged; // a notification about changing theme

@interface AMFThemeFactory : NSObject {
    AMFTheme *_curtheme;
}

@property(nonatomic, strong, readonly) NSArray<AMFTheme*> *themes;

/**
initializes with preloaded themes
 */
- (instancetype)initWithThemes:(NSArray *)themes;

/**
 returns current selected theme
 */
- (AMFTheme*) curTheme;

/**
 changes current theme from installed in the system with index
 */
-(void) changeTheme:(NSUInteger) index;


@end
