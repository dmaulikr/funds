//
//  ApplicationAssembly.m
//  funds
//
//  Created by Michael on 07.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "ApplicationAssembly.h"
#import "AppDelegate.h"
#import "AMFAppDelegateForReadingCSV.h"
#import "AMFDataSupplierAssembly.h"
#import <RamblerAppDelegateProxy/RamblerAppDelegateProxy.h>

@implementation ApplicationAssembly

- (RamblerAppDelegateProxy *)applicationDelegateProxy {
    return [TyphoonDefinition withClass:[RamblerAppDelegateProxy class]
                          configuration:^(TyphoonDefinition *definition){
                              [definition injectMethod:@selector(addAppDelegates:)
                                            parameters:^(TyphoonMethod *method) {
                                                NSArray *appDelegates = @[
                                                         [self defaultAppDelegate],
                                                         [self delegateForImportCSV]
                                                ];
                                                [method injectParameterWith:appDelegates];
                                            }];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

- (AppDelegate *)defaultAppDelegate {
    return [TyphoonDefinition withClass:[AppDelegate class]];
}

- (AMFAppDelegateForReadingCSV*)delegateForImportCSV {
    return [TyphoonDefinition withClass:[AMFAppDelegateForReadingCSV class] configuration:^(TyphoonDefinition *definition){
        [definition injectProperty:@selector(csvReader)
                              with:[self.dataAssembly csvReader]];
    }];
}
@end
