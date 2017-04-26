//
//  AMFChooseCategoryInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseCategoryInteractor.h"

#import "AMFChooseCategoryInteractorOutput.h"

@interface AMFChooseCategoryInteractorTests : XCTestCase

@property (nonatomic, strong) AMFChooseCategoryInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFChooseCategoryInteractorTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFChooseCategoryInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFChooseCategoryInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Testing of Methods of AMFChooseCategoryInteractorInput

@end
