//
//  AMFNameIconSetterInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFNameIconSetterInteractor.h"

#import "AMFNameIconSetterInteractorOutput.h"

@interface AMFNameIconSetterInteractorTests : XCTestCase

@property (nonatomic, strong) AMFNameIconSetterInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFNameIconSetterInteractorTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFNameIconSetterInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFNameIconSetterInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Testing of Methods of AMFNameIconSetterInteractorInput

@end
