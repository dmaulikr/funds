//
//  AMFPageChooserViewControllerTests.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFPageChooserViewController.h"

#import "AMFPageChooserViewOutput.h"

@interface AMFPageChooserViewControllerTests : XCTestCase

@property (nonatomic, strong) AMFPageChooserViewController *controller;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFPageChooserViewControllerTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.controller = [[AMFPageChooserViewController alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFPageChooserViewOutput));

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

#pragma mark - Тестирование методов AMFPageChooserViewInput

@end
