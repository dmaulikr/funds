//
//  AMFEditCategoryPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFEditCategoryPresenter.h"

#import "AMFEditCategoryViewInput.h"
#import "AMFEditCategoryInteractorInput.h"
#import "AMFEditCategoryRouterInput.h"

@interface AMFEditCategoryPresenterTests : XCTestCase

@property (nonatomic, strong) AMFEditCategoryPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFEditCategoryPresenterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFEditCategoryPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFEditCategoryInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFEditCategoryRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFEditCategoryViewInput));

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

#pragma mark - The testing of methods in AMFEditCategoryModuleInput

#pragma mark - The testing of methods in AMFEditCategoryViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - The testing of methods in AMFEditCategoryInteractorOutput

@end
