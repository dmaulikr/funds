//
//  TyphoonAppDelegate.m
//  funds
//
//  Created by Michael on 07.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "TyphoonAppDelegate.h"

#import <RamblerTyphoonUtils/AssemblyCollector.h>

@implementation TyphoonAppDelegate

- (NSArray *)initialAssemblies {
    RamblerInitialAssemblyCollector *collector = [RamblerInitialAssemblyCollector new];
    return [collector collectInitialAssemblyClasses];
}

@end
