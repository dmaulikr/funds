//
//  AMFNameIconSetterPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFNameIconSetterPresenter.h"

#import "AMFNameIconSetterViewInput.h"
#import "AMFNameIconSetterInteractorInput.h"
#import "AMFNameIconSetterRouterInput.h"

@interface AMFNameIconSetterPresenterTests : XCTestCase

@property (nonatomic, strong) AMFNameIconSetterPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFNameIconSetterPresenterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFNameIconSetterPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFNameIconSetterInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFNameIconSetterRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFNameIconSetterViewInput));

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

#pragma mark - The testing of methods in AMFNameIconSetterModuleInput

#pragma mark - The testing of methods in AMFNameIconSetterViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - The testing of methods in AMFNameIconSetterInteractorOutput

@end
