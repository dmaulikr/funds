//
//  AMFThemeAssembly.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFThemeAssembly.h"
#import "AMFTheme.h"
#import "AMFThemeFactory.h"

@implementation AMFThemeAssembly

- (AMFTheme *) currentTheme {
    return [TyphoonDefinition withFactory:[self themeFactory] selector:@selector(curTheme)];
}

- (AMFThemeFactory *) themeFactory
{
    return [TyphoonDefinition withClass:[AMFThemeFactory class] configuration:^(TyphoonDefinition *definition)
            {
                [definition useInitializer:@selector(initWithThemes:) parameters:^(TyphoonMethod *initializer)
                 {
                     [initializer injectParameterWith:@[
                                                        [self firstTheme]
                                                        ]];
                 }];
                definition.scope = TyphoonScopeSingleton;
            }];
}

- (AMFTheme*) firstTheme {
    return [TyphoonDefinition withClass:[AMFTheme class] configuration:^(TyphoonDefinition *definition)
            {
                [definition injectProperty:@selector(backgroundResourceName) with:@"bg3.png"];
                [definition injectProperty:@selector(navigationBarColor) with:[UIColor blackColor]];
                [definition injectProperty:@selector(navigationFontName) with:@"Verdana"];
                [definition injectProperty:@selector(navigationFontSize) with:@12];
                
                [definition injectProperty:@selector(mainStringFontName) with:@"Verdana"];
                [definition injectProperty:@selector(mainStringFontSize) with:@12];
            }];
    
}
@end
