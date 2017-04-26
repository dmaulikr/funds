//
//  AMFBalanceRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFBalanceRouter.h"

@interface AMFBalanceRouterTests : XCTestCase

@property (nonatomic, strong) AMFBalanceRouter *router;

@end

@implementation AMFBalanceRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[AMFBalanceRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
