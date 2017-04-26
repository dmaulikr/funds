//
//  AMFBalanceViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFBalanceViewController.h"

#import "AMFBalanceViewOutput.h"

@interface AMFBalanceViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFBalanceViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFBalanceViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[AMFBalanceViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFBalanceViewOutput));

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

#pragma mark - Тестирование методов AMFBalanceViewInput

@end
