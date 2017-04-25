//
//  AMFAddRecordViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddRecordViewController.h"

#import "AMFAddRecordViewOutput.h"

@interface AMFAddRecordViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFAddRecordViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFAddRecordViewControllerTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.controller = [[AMFAddRecordViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFAddRecordViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Testing the life cycle events

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Testing interface methods

#pragma mark - Testing of methods in AMFAddRecordViewInput

@end
