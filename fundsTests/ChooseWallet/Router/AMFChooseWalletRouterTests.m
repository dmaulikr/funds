//
//  AMFChooseWalletRouterTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "AMFChooseWalletRouter.h"

@interface AMFChooseWalletRouterTests : XCTestCase

@property (nonatomic, strong) AMFChooseWalletRouter *router;

@end

@implementation AMFChooseWalletRouterTests

#pragma mark - Environment of testing

- (void)setUp {
    [super setUp];

    self.router = [[AMFChooseWalletRouter alloc] init];
}

- (void)tearDown {
    self.router = nil;

    [super tearDown];
}

@end
