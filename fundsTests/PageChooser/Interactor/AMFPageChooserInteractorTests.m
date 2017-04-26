//
//  AMFPageChooserInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFPageChooserInteractor.h"

#import "AMFPageChooserInteractorOutput.h"

@interface AMFPageChooserInteractorTests : XCTestCase

@property (nonatomic, strong) AMFPageChooserInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFPageChooserInteractorTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFPageChooserInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFPageChooserInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Тестирование методов AMFPageChooserInteractorInput

@end
