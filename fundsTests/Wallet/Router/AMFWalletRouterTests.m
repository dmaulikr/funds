//
//  AMFWalletRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 08/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFWalletRouter.h"

@interface AMFWalletRouterTests : XCTestCase

@property (nonatomic, strong) AMFWalletRouter *router;

@end

@implementation AMFWalletRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[AMFWalletRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
