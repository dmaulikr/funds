//
//  AMFFlowModuleAssembly.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFThemeAssembly;
@class AMFDataSupplierAssembly;

@interface AMFFlowModuleAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property(nonatomic, strong, readonly) AMFThemeAssembly *themeProvider;
@property(nonatomic, strong, readonly) AMFDataSupplierAssembly *dataProvider;

@end
