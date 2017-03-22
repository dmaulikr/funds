//
//  AMFAddPagePresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddPagePresenter.h"

#import "AMFAddPageViewInput.h"
#import "AMFAddPageInteractorInput.h"
#import "AMFAddPageRouterInput.h"

@interface AMFAddPagePresenterTests : XCTestCase

@property (nonatomic, strong) AMFAddPagePresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFAddPagePresenterTests

#pragma mark - Setup of the environment for testing

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFAddPagePresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFAddPageInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFAddPageRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFAddPageViewInput));

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

#pragma mark - Testing of methods AMFAddPageModuleInput

#pragma mark - Testing of methods AMFAddPageViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - Testing of methods AMFAddPageInteractorOutput

@end
