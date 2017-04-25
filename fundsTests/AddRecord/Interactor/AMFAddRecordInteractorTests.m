//
//  AMFAddRecordInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddRecordInteractor.h"

#import "AMFAddRecordInteractorOutput.h"

@interface AMFAddRecordInteractorTests : XCTestCase

@property (nonatomic, strong) AMFAddRecordInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFAddRecordInteractorTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFAddRecordInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFAddRecordInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Testing of Methods of AMFAddRecordInteractorInput

@end
