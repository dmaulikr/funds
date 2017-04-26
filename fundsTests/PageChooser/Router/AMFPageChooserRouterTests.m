//
//  AMFPageChooserRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFPageChooserRouter.h"

@interface AMFPageChooserRouterTests : XCTestCase

@property (nonatomic, strong) AMFPageChooserRouter *router;

@end

@implementation AMFPageChooserRouterTests

#pragma mark - Настройка окружения для тестирования

- (void)setUp {
    [super setUp];

    self.router = [[AMFPageChooserRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
