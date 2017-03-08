//
//  AMFThemeFactory.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AMFTheme;

@interface AMFThemeFactory : NSObject {
    AMFTheme *_curtheme;
}

@property(nonatomic, strong, readonly) NSArray<AMFTheme*> *themes;

- (instancetype)initWithThemes:(NSArray *)themes;

- (AMFTheme*) curTheme;

@end
