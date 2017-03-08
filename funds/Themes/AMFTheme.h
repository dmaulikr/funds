//
//  AMFTheme.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 @author Michael Artuerhof
 
 represents a single theme (lists all elements which could be changed in the app)
 */
@interface AMFTheme : NSObject

/**
 Background image name. We could declare this property as a UIImage,
 however as we're storing a singleton collection of themes we'll use
 NSString to save memory.
 */
@property (nonatomic, strong, readonly) NSString *backgroundResourceName;

/**
 the navigation (upper) bar color
 */
@property (nonatomic, strong, readonly) UIColor *navigationBarColor;
@property (nonatomic, strong, readonly) NSString *navigationFontName;
@property (nonatomic, assign, readonly) NSUInteger navigationFontSize;

@property (nonatomic, strong, readonly) NSString *mainStringFontName;
@property (nonatomic, assign, readonly) NSUInteger mainStringFontSize;

@end
