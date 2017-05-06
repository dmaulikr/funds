//
//  AMFNameIconSetterViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFNameIconSetterViewController.h"

#import "AMFNameIconSetterViewOutput.h"

@interface AMFNameIconSetterViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFNameIconSetterViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFNameIconSetterViewControllerTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.controller = [[AMFNameIconSetterViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFNameIconSetterViewOutput));

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

#pragma mark - Testing of methods in AMFNameIconSetterViewInput

@end
