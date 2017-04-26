//
//  AMFFlowInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 10/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFFlowInteractor.h"

#import "AMFFlowInteractorOutput.h"

@interface AMFFlowInteractorTests : XCTestCase

@property (nonatomic, strong) AMFFlowInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFFlowInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFFlowInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFFlowInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов AMFFlowInteractorInput

@end
