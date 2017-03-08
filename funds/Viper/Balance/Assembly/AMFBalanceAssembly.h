//
//  AMFBalanceAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFThemeAssembly;

/**
 @author Michael Artuerhof

 Balance module
 */
@interface AMFBalanceAssembly : TyphoonAssembly <RamblerInitialAssembly>


@property(nonatomic, strong, readonly) AMFThemeAssembly *themeProvider;

@end
