//
//  AMFChooseCategoryRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseCategoryRouter.h"

@interface AMFChooseCategoryRouterTests : XCTestCase

@property (nonatomic, strong) AMFChooseCategoryRouter *router;

@end

@implementation AMFChooseCategoryRouterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.router = [[AMFChooseCategoryRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
