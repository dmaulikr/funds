//
//  AMFNameIconSetterAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@class AMFAlertsAssembly;

/**
 @author Michael Artuerhof

 NameIconSetter module
 */
@interface AMFNameIconSetterAssembly : TyphoonAssembly <RamblerInitialAssembly>

@property(nonatomic, strong, readonly) AMFAlertsAssembly *alerts;

@end
