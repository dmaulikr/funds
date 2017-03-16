//
//  AMFThemeFactory.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFThemeFactory.h"

NSString * const kThemeChanged = @"THEME_WAS_CHANGED"; // for notification
static NSString *const kCurrentThemeIndexFileName = @"AMF_SELECTED_THEME_INDEX";

@implementation AMFThemeFactory

#pragma mark - Initialization & Destruction

- (instancetype)initWithThemes:(NSArray <AMFTheme*> *)themes {

    if ([themes count] == 0) {
        [NSException raise:NSInvalidArgumentException format:@"We need at least one theme in collection"];
    }

    self = [super init];
    if (self) {
        _themes = themes;
    }
    return self;
}

#pragma mark - Current Theme

-(AMFTheme*) themeWithIndex:(NSUInteger)index {
	LogDebug(@"Current theme index is: %li", (long)index);
    if (index > [_themes count] - 1) {
        LogDebug(@"!!resetting index");
        index = 0;
    }
    _curtheme = [_themes objectAtIndex:index];
    [[NSNotificationCenter defaultCenter] postNotificationName:kThemeChanged object:_curtheme];
    return _curtheme;
}

-(AMFTheme*) curTheme {
    if (!_curtheme) {
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* documentsDirectory = [paths objectAtIndex:0];
        NSString* indexFileName = [documentsDirectory stringByAppendingPathComponent:kCurrentThemeIndexFileName];

        LogDebug(@"Index file name: %@", indexFileName);

        NSInteger index = [[NSString stringWithContentsOfFile:indexFileName encoding:NSUTF8StringEncoding error:nil] integerValue];
        _curtheme = [self themeWithIndex:index];
    }
    return _curtheme;
}

#pragma mark - Changing Current Theme

-(void) changeTheme:(NSUInteger) index {
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDirectory = [paths objectAtIndex:0];
    NSString* indexFileName = [documentsDirectory stringByAppendingPathComponent:kCurrentThemeIndexFileName];
    // first write into file for the next time:
    [[NSString stringWithFormat:@"%li", (long)index] writeToFile:indexFileName atomically:NO encoding:NSUTF8StringEncoding error:nil];
    // and apply it
    _curtheme = [self themeWithIndex:index];
}
@end
