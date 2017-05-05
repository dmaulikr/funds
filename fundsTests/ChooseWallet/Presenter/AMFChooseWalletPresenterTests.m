//
//  AMFChooseWalletPresenterTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseWalletPresenter.h"

#import "AMFChooseWalletViewInput.h"
#import "AMFChooseWalletInteractorInput.h"
#import "AMFChooseWalletRouterInput.h"

@interface AMFChooseWalletPresenterTests : XCTestCase

@property (nonatomic, strong) AMFChooseWalletPresenter *presenter;

@property (nonatomic, strong) id mockInteractor;
@property (nonatomic, strong) id mockRouter;
@property (nonatomic, strong) id mockView;

@end

@implementation AMFChooseWalletPresenterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.presenter = [[AMFChooseWalletPresenter alloc] init];

    self.mockInteractor = OCMProtocolMock(@protocol(AMFChooseWalletInteractorInput));
    self.mockRouter = OCMProtocolMock(@protocol(AMFChooseWalletRouterInput));
    self.mockView = OCMProtocolMock(@protocol(AMFChooseWalletViewInput));

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

#pragma mark - The testing of methods in AMFChooseWalletModuleInput

#pragma mark - The testing of methods in AMFChooseWalletViewOutput

- (void)testThatPresenterHandlesViewReadyEvent {
    // given


    // when
    [self.presenter didTriggerViewReadyEvent];

    // then
    OCMVerify([self.mockView setupInitialState]);
}

#pragma mark - The testing of methods in AMFChooseWalletInteractorOutput

@end
