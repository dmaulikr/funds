//
//  AMFChooseWalletViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseWalletViewController.h"

#import "AMFChooseWalletViewOutput.h"

@interface AMFChooseWalletViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFChooseWalletViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFChooseWalletViewControllerTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.controller = [[AMFChooseWalletViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFChooseWalletViewOutput));

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

#pragma mark - Testing of methods in AMFChooseWalletViewInput

@end
