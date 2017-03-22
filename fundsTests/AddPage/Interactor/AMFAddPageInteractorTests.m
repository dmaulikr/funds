//
//  AMFAddPageInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddPageInteractor.h"

#import "AMFAddPageInteractorOutput.h"

@interface AMFAddPageInteractorTests : XCTestCase

@property (nonatomic, strong) AMFAddPageInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFAddPageInteractorTests

#pragma mark - Setup of the environment for testing

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFAddPageInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFAddPageInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Testing of methods AMFAddPageInteractorInput

@end
