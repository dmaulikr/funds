//
//  AMFChooseWalletInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseWalletInteractor.h"

#import "AMFChooseWalletInteractorOutput.h"

@interface AMFChooseWalletInteractorTests : XCTestCase

@property (nonatomic, strong) AMFChooseWalletInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFChooseWalletInteractorTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFChooseWalletInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFChooseWalletInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Testing of Methods of AMFChooseWalletInteractorInput

@end
