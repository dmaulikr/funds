//
//  AMFFlowViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 10/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFFlowViewController.h"

#import "AMFFlowViewOutput.h"

@interface AMFFlowViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFFlowViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFFlowViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[AMFFlowViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFFlowViewOutput));

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

#pragma mark - Тестирование методов AMFFlowViewInput

@end
