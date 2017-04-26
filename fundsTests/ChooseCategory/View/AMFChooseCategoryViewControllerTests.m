//
//  AMFChooseCategoryViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseCategoryViewController.h"

#import "AMFChooseCategoryViewOutput.h"

@interface AMFChooseCategoryViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFChooseCategoryViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFChooseCategoryViewControllerTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.controller = [[AMFChooseCategoryViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFChooseCategoryViewOutput));

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

#pragma mark - Testing of methods in AMFChooseCategoryViewInput

@end
