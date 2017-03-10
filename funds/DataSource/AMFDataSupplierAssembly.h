//
//  AMFDataSupplierAssembly.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Typhoon/Typhoon.h>
#import <RamblerTyphoonUtils/AssemblyCollector.h>

@protocol AMFDataSupplyProtocol;
@protocol AMFStorageHandlerProtocol;
@protocol AMFFileIntoDBReader;

@interface AMFDataSupplierAssembly : TyphoonAssembly <RamblerInitialAssembly>

-(id<AMFDataSupplyProtocol>) dataSupplier;
-(id<AMFStorageHandlerProtocol>) storageHandler;
-(id<AMFFileIntoDBReader>) csvReader;

@end
