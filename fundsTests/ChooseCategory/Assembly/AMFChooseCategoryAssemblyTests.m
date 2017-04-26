//
//  AMFChooseCategoryAssemblyTests.m
//  funds
//
//  Created by Michael Artuerhof on 26/04/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "AMFChooseCategoryAssembly.h"
#import "AMFChooseCategoryAssembly_Testable.h"

#import "AMFChooseCategoryViewController.h"
#import "AMFChooseCategoryPresenter.h"
#import "AMFChooseCategoryInteractor.h"
#import "AMFChooseCategoryRouter.h"

@interface AMFChooseCategoryAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) AMFChooseCategoryAssembly *assembly;

@end

@implementation AMFChooseCategoryAssemblyTests

#pragma mark - The enviroment for testing

- (void)setUp {
    [super setUp];

    self.assembly = [[AMFChooseCategoryAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Testing of the module's parts assembly

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [AMFChooseCategoryViewController class];
    NSArray *protocols = @[
                           @protocol(AMFChooseCategoryViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewChooseCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [AMFChooseCategoryPresenter class];
    NSArray *protocols = @[
                           @protocol(AMFChooseCategoryModuleInput),
                           @protocol(AMFChooseCategoryViewOutput),
                           @protocol(AMFChooseCategoryInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterChooseCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [AMFChooseCategoryInteractor class];
    NSArray *protocols = @[
                           @protocol(AMFChooseCategoryInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly interactorChooseCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [AMFChooseCategoryRouter class];
    NSArray *protocols = @[
                           @protocol(AMFChooseCategoryRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerChooseCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
