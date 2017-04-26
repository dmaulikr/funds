//
//  AMFChooseCategoryPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseCategoryPresenter.h"

#import "AMFChooseCategoryViewInput.h"
#import "AMFChooseCategoryInteractorInput.h"
#import "AMFChooseCategoryRouterInput.h"

@interface AMFChooseCategoryPresenterTests : XCTestCase

@property (nonatomic, strong) AMFChooseCategoryPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFChooseCategoryPresenterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFChooseCategoryPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFChooseCategoryInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFChooseCategoryRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFChooseCategoryViewInput));

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

#pragma mark - The testing of methods in AMFChooseCategoryModuleInput

#pragma mark - The testing of methods in AMFChooseCategoryViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - The testing of methods in AMFChooseCategoryInteractorOutput

@end
