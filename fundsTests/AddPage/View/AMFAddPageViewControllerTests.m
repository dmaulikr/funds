//
//  AMFAddPageViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddPageViewController.h"

#import "AMFAddPageViewOutput.h"

@interface AMFAddPageViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFAddPageViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFAddPageViewControllerTests

#pragma mark - Setup of the environment for testing

- (void)setUp {
    [super setUp];

    self.controller = [[AMFAddPageViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFAddPageViewOutput));

    self.controller.output = self.mockOutput;
}

- (void)tearDown {
    self.controller = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование жизненного цикла

- (void)testThatControllerNotifiesPresenterOnDidLoad {
	// given

	// when
	[self.controller viewDidLoad];

	// then
	OCMVerify([self.mockOutput didTriggerViewReadyEvent]);
}

#pragma mark - Тестирование методов интерфейса

#pragma mark - Тестирование методов AMFAddPageViewInput

@end
