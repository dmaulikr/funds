//
//  AMFAddRecordRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddRecordRouter.h"

@interface AMFAddRecordRouterTests : XCTestCase

@property (nonatomic, strong) AMFAddRecordRouter *router;

@end

@implementation AMFAddRecordRouterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.router = [[AMFAddRecordRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
