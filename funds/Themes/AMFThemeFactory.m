//
//  AMFThemeFactory.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFThemeFactory.h"

static NSString* const kCurrentThemeIndexFileName = @"AMF_CURRENT_THEME_INDEX";

@implementation AMFThemeFactory

#pragma mark - Initialization & Destruction

- (instancetype)initWithThemes:(NSArray <AMFTheme*> *)themes {
    
    if ([themes count] == 0) {
        [NSException raise:NSInvalidArgumentException format:@"Sequential theme requires at least one theme in collection"];
    }
    
    self = [super init];
    if (self) {
        _themes = themes;
    }
    return self;
}

#pragma mark - Current Theme

- (AMFTheme*) curTheme {
    
    if (!_curtheme) {
        NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString* documentsDirectory = [paths objectAtIndex:0];
        NSString* indexFileName = [documentsDirectory stringByAppendingPathComponent:kCurrentThemeIndexFileName];
        LogDebug(@"Index file name: %@", indexFileName);
        
        NSInteger index = [[NSString stringWithContentsOfFile:indexFileName encoding:NSUTF8StringEncoding error:nil] integerValue];
        LogDebug(@"Current theme index is: %li", index);
        if (index > [_themes count] - 1) {
            LogDebug(@"!!resetting index");
            index = 0;
        }
        _curtheme = [_themes objectAtIndex:index];
        
        [[NSString stringWithFormat:@"%li", (index + 1)] writeToFile:indexFileName atomically:NO encoding:NSUTF8StringEncoding error:nil];
    }
    return _curtheme;
}
@end
