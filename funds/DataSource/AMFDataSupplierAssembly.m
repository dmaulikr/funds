//
//  AMFDataSupplierAssembly.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFDataSupplierAssembly.h"
#import "AMFDataSupplier.h"
#import "AMFSQLCoreDataHandler.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFDataSupplyProtocol.h"
#import "AMFFileIntoDBReader.h"
#import "AMFReaderFromCSV.h"

@implementation AMFDataSupplierAssembly

-(id<AMFDataSupplyProtocol>) dataSupplier {
    return [TyphoonDefinition withClass:[AMFDataSupplier class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(handler)
                                                    with:[self storageHandler]];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

-(id<AMFStorageHandlerProtocol>) storageHandler {
    return [TyphoonDefinition withClass:[AMFSQLCoreDataHandler class]
                          configuration:^(TyphoonDefinition *definition) {
                              definition.scope = TyphoonScopeSingleton;
                          }];
}

-(id<AMFFileIntoDBReader>) csvReader {
    return [TyphoonDefinition withClass:[AMFReaderFromCSV class]
                          configuration:^(TyphoonDefinition *definition) {
                              [definition injectProperty:@selector(handler)
                                                    with:[self storageHandler]];
                              definition.scope = TyphoonScopeSingleton;
                          }];
}
@end
