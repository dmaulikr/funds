//
//  AMFEditCategoryViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFEditCategoryViewController.h"

#import "AMFEditCategoryViewOutput.h"

@interface AMFEditCategoryViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFEditCategoryViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFEditCategoryViewControllerTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.controller = [[AMFEditCategoryViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFEditCategoryViewOutput));

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

#pragma mark - Testing of methods in AMFEditCategoryViewInput

@end
