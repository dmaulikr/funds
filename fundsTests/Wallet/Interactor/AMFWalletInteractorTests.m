//
//  AMFWalletInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFWalletInteractor.h"

#import "AMFWalletInteractorOutput.h"

@interface AMFWalletInteractorTests : XCTestCase

@property (nonatomic, strong) AMFWalletInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFWalletInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFWalletInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFWalletInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов AMFWalletInteractorInput

@end
