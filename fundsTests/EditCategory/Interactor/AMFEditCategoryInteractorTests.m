//
//  AMFEditCategoryInteractorTests.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFEditCategoryInteractor.h"

#import "AMFEditCategoryInteractorOutput.h"

@interface AMFEditCategoryInteractorTests : XCTestCase

@property (nonatomic, strong) AMFEditCategoryInteractor *interactor;

@property (nonatomic, strong) id mockOutput;

@end

@implementation AMFEditCategoryInteractorTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.interactor = [[AMFEditCategoryInteractor alloc] init];

    self.mockOutput = OCMProtocolMock(@protocol(AMFEditCategoryInteractorOutput));

    self.interactor.output = self.mockOutput;
}

- (void)tearDown {
    self.interactor = nil;

    self.mockOutput = nil;

    [super tearDown];
}

#pragma mark - Testing of Methods of AMFEditCategoryInteractorInput

@end
