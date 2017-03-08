//
//  AMFDataSupplierAssembly.m
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFDataSupplierAssembly.h"
#import "AMFDataSupplier.h"

@implementation AMFDataSupplierAssembly

-(id<AMFDataSupplyProtocol>) dataSupplier {
    return [TyphoonDefinition withClass:[AMFDataSupplier class]
                          configuration:^(TyphoonDefinition *definition) {
                              
                          }];
}
@end
