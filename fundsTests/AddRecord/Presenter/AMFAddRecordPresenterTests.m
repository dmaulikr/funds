//
//  AMFAddRecordPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddRecordPresenter.h"

#import "AMFAddRecordViewInput.h"
#import "AMFAddRecordInteractorInput.h"
#import "AMFAddRecordRouterInput.h"

@interface AMFAddRecordPresenterTests : XCTestCase

@property (nonatomic, strong) AMFAddRecordPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFAddRecordPresenterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFAddRecordPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFAddRecordInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFAddRecordRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFAddRecordViewInput));

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

#pragma mark - The testing of methods in AMFAddRecordModuleInput

#pragma mark - The testing of methods in AMFAddRecordViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - The testing of methods in AMFAddRecordInteractorOutput

@end
