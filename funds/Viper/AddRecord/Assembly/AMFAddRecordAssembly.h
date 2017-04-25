//
//  AMFAddRecordAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFAlertsAssembly;
@class AMFDataSupplierAssembly;

/**
 @author Michael Artuerhof

 AddRecord module
 */
@interface AMFAddRecordAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property(nonatomic, strong, readonly) AMFAlertsAssembly *alerts;
@property(nonatomic, strong, readonly) AMFDataSupplierAssembly *dataProvider;

@end
