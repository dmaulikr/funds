//
//  AMFCurrenciesAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 12/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFThemeAssembly;
@class AMFAlertsAssembly;
@class AMFDataSupplierAssembly;

/**
 @author Michael Artuerhof

 Currencies module
 */
@interface AMFCurrenciesAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property(nonatomic, strong, readonly) AMFThemeAssembly *themeProvider;
@property(nonatomic, strong, readonly) AMFDataSupplierAssembly *dataProvider;
@property(nonatomic, strong, readonly) AMFAlertsAssembly *alerts;

@end
