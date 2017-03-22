//
//  AMFAlertsAssembly.h
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol AMFSimpleAlertProtocol;

@interface AMFAlertsAssembly : TyphoonAssembly <RamblerInitialAssembly>

-(id<AMFSimpleAlertProtocol>) alertFactory;

@end
