//
//  AMFThemeAssembly.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFTheme;

@interface AMFThemeAssembly : TyphoonAssembly <RamblerInitialAssembly>

- (AMFTheme *) currentTheme;

@end
