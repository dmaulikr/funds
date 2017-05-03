//
//  AMFAddPageAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFAlertsAssembly;
@class AMFDataSupplierAssembly;

/**
 @author Michael Artuerhof

 AddPage module
 */
@interface AMFAddPageAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property(nonatomic, strong, readonly) AMFAlertsAssembly *alerts;
@property(nonatomic, strong, readonly) AMFDataSupplierAssembly *dataProvider;

@end
