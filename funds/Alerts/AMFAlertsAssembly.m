//
//  AMFAlertsAssembly.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAlertsAssembly.h"
#import "AMFSimpleAlertProtocol.h"
#import "AMFSimpleAlertFactory.h"

@implementation AMFAlertsAssembly

- (id<AMFSimpleAlertProtocol>)alertFactory {
    return [TyphoonDefinition withClass:[AMFSimpleAlertFactory class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeSingleton;
    }];
}

@end
