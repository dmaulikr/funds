//
//  ApplicationAssembly.h
//  funds
//
//  Created by Michael on 07.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

/**
 @author Michael Artuerhof

 Collects all App Delegates together
 */
@interface ApplicationAssembly : TyphoonAssembly <RamblerInitialAssembly>

@end
