//
//  AMFWalletPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFWalletPresenter.h"

#import "AMFWalletViewInput.h"
#import "AMFWalletInteractorInput.h"
#import "AMFWalletRouterInput.h"

@interface AMFWalletPresenterTests : XCTestCase

@property (nonatomic, strong) AMFWalletPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFWalletPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFWalletPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFWalletInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFWalletRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFWalletViewInput));

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

#pragma mark - Тестирование методов AMFWalletModuleInput

#pragma mark - Тестирование методов AMFWalletViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов AMFWalletInteractorOutput

@end
