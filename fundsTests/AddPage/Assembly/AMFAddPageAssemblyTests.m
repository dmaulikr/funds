//
//  AMFAddPageAssemblyTests.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "AMFAddPageAssembly.h"
#import "AMFAddPageAssembly_Testable.h"

#import "AMFAddPageViewController.h"
#import "AMFAddPagePresenter.h"
#import "AMFAddPageInteractor.h"
#import "AMFAddPageRouter.h"

@interface AMFAddPageAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) AMFAddPageAssembly *assembly;

@end

@implementation AMFAddPageAssemblyTests

#pragma mark - Setup of the environment for testing

- (void)setUp {
    [super setUp];

    self.assembly = [[AMFAddPageAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Testing of elements creation

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [AMFAddPageViewController class];
    NSArray *protocols = @[
                           @protocol(AMFAddPageViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewAddPage];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [AMFAddPagePresenter class];
    NSArray *protocols = @[
                           @protocol(AMFAddPageModuleInput),
                           @protocol(AMFAddPageViewOutput),
                           @protocol(AMFAddPageInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterAddPage];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [AMFAddPageInteractor class];
    NSArray *protocols = @[
                           @protocol(AMFAddPageInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly interactorAddPage];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [AMFAddPageRouter class];
    NSArray *protocols = @[
                           @protocol(AMFAddPageRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerAddPage];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
