//
//  AMFBalancePresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFBalancePresenter.h"

#import "AMFBalanceViewInput.h"
#import "AMFBalanceInteractorInput.h"
#import "AMFBalanceRouterInput.h"

@interface AMFBalancePresenterTests : XCTestCase

@property (nonatomic, strong) AMFBalancePresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFBalancePresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFBalancePresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFBalanceInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFBalanceRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFBalanceViewInput));

    self.presenter.interactor = self.mockInteractor;
    self.presenter.router = self.mockRouter;
    self.presenter.view = self.mockView;
}

- (void)tearDown {
    self.presenter = nil;

    self.mockView = nil;
    self.mockRouter = nil;
    self.mockInteractor = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов AMFBalanceModuleInput

#pragma mark - Тестирование методов AMFBalanceViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов AMFBalanceInteractorOutput

@end
