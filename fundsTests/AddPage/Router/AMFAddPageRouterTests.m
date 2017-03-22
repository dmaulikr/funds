//
//  AMFAddPageRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFAddPageRouter.h"

@interface AMFAddPageRouterTests : XCTestCase

@property (nonatomic, strong) AMFAddPageRouter *router;

@end

@implementation AMFAddPageRouterTests

#pragma mark - Setup of the environment for testing

- (void)setUp {
    [super setUp];

    self.router = [[AMFAddPageRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
