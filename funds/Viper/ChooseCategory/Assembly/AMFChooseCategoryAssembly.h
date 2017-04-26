//
//  AMFChooseCategoryAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFDataSupplierAssembly;
@class AMFAlertsAssembly;

/**
 @author Michael Artuerhof

 ChooseCategory module
 */
@interface AMFChooseCategoryAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property(nonatomic, strong, readonly) AMFAlertsAssembly *alerts;
@property(nonatomic, strong, readonly) AMFDataSupplierAssembly *dataProvider;

@end
