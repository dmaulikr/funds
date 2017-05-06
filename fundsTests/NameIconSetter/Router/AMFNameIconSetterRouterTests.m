//
//  AMFNameIconSetterRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFNameIconSetterRouter.h"

@interface AMFNameIconSetterRouterTests : XCTestCase

@property (nonatomic, strong) AMFNameIconSetterRouter *router;

@end

@implementation AMFNameIconSetterRouterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.router = [[AMFNameIconSetterRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
