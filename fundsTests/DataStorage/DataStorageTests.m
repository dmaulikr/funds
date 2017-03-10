//
//  DataStorageTests.m
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>
#import "AMFDataSupplierAssembly.h"
#import "AMFReaderFromCSV.h"
#import "AMFSQLCoreDataHandler.h"

@interface DataStorageTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) AMFDataSupplierAssembly *assembly;

@end

@implementation DataStorageTests

- (void)setUp {
    [super setUp];
    self.assembly = [[AMFDataSupplierAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;
    [super tearDown];
}

- (void)testAddDataFromCSV {
    // given
    AMFReaderFromCSV *supplier = self.assembly.csvReader;
    AMFSQLCoreDataHandler *handler = supplier.handler;
    NSString *file = [[NSBundle bundleForClass:[self class]] pathForResource:@"test"
                                                                      ofType:@"csv"];
    // when
    [supplier populateContentsWithFile:file];
    
    // then
    XCTAssert([handler grabAllRecords].count == 10);
}

@end
