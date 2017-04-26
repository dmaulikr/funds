//
//  AMFPageChooserPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFPageChooserPresenter.h"

#import "AMFPageChooserViewInput.h"
#import "AMFPageChooserInteractorInput.h"
#import "AMFPageChooserRouterInput.h"

@interface AMFPageChooserPresenterTests : XCTestCase

@property (nonatomic, strong) AMFPageChooserPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFPageChooserPresenterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFPageChooserPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFPageChooserInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFPageChooserRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFPageChooserViewInput));

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

#pragma mark - Тестирование методов AMFPageChooserModuleInput

#pragma mark - Тестирование методов AMFPageChooserViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Тестирование методов AMFPageChooserInteractorOutput

@end
