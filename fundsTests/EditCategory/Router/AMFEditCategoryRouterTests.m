//
//  AMFEditCategoryRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFEditCategoryRouter.h"

@interface AMFEditCategoryRouterTests : XCTestCase

@property (nonatomic, strong) AMFEditCategoryRouter *router;

@end

@implementation AMFEditCategoryRouterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.router = [[AMFEditCategoryRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
