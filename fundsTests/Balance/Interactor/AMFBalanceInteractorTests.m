//
//  AMFBalanceInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFBalanceInteractor.h"

#import "AMFBalanceInteractorOutput.h"

@interface AMFBalanceInteractorTests : XCTestCase

@property (nonatomic, strong) AMFBalanceInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFBalanceInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFBalanceInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFBalanceInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов AMFBalanceInteractorInput

@end
