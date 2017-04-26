//
//  AMFFlowRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 10/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFFlowRouter.h"

@interface AMFFlowRouterTests : XCTestCase

@property (nonatomic, strong) AMFFlowRouter *router;

@end

@implementation AMFFlowRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[AMFFlowRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
