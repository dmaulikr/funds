//
//  AMFChooseWalletAssemblyTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "AMFChooseWalletAssembly.h"
#import "AMFChooseWalletAssembly_Testable.h"

#import "AMFChooseWalletViewController.h"
#import "AMFChooseWalletPresenter.h"
#import "AMFChooseWalletInteractor.h"
#import "AMFChooseWalletRouter.h"

@interface AMFChooseWalletAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) AMFChooseWalletAssembly *assembly;

@end

@implementation AMFChooseWalletAssemblyTests

#pragma mark - The enviroment for testing

- (void)setUp {
    [super setUp];

    self.assembly = [[AMFChooseWalletAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Testing of the module's parts assembly

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [AMFChooseWalletViewController class];
    NSArray *protocols = @[
                           @protocol(AMFChooseWalletViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewChooseWallet];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [AMFChooseWalletPresenter class];
    NSArray *protocols = @[
                           @protocol(AMFChooseWalletModuleInput),
                           @protocol(AMFChooseWalletViewOutput),
                           @protocol(AMFChooseWalletInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterChooseWallet];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [AMFChooseWalletInteractor class];
    NSArray *protocols = @[
                           @protocol(AMFChooseWalletInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly interactorChooseWallet];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [AMFChooseWalletRouter class];
    NSArray *protocols = @[
                           @protocol(AMFChooseWalletRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerChooseWallet];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
