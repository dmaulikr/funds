//
//  AMFFlowPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 10/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFFlowPresenter.h"

#import "AMFFlowViewInput.h"
#import "AMFFlowInteractorInput.h"
#import "AMFFlowRouterInput.h"

@interface AMFFlowPresenterTests : XCTestCase

@property (nonatomic, strong) AMFFlowPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFFlowPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFFlowPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFFlowInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFFlowRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFFlowViewInput));

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

#pragma mark - Тестирование методов AMFFlowModuleInput

#pragma mark - Тестирование методов AMFFlowViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов AMFFlowInteractorOutput

@end
