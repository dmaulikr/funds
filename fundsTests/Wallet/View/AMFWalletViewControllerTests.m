//
//  AMFWalletViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFWalletViewController.h"

#import "AMFWalletViewOutput.h"

@interface AMFWalletViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFWalletViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFWalletViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[AMFWalletViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFWalletViewOutput));

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

#pragma mark - Тестирование методов AMFWalletViewInput

@end
