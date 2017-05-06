//
//  AMFNameIconSetterAssemblyTests.m
//  funds
//
//  Created by Michael Artuerhof on 05/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "AMFNameIconSetterAssembly.h"
#import "AMFNameIconSetterAssembly_Testable.h"

#import "AMFNameIconSetterViewController.h"
#import "AMFNameIconSetterPresenter.h"
#import "AMFNameIconSetterInteractor.h"
#import "AMFNameIconSetterRouter.h"

@interface AMFNameIconSetterAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) AMFNameIconSetterAssembly *assembly;

@end

@implementation AMFNameIconSetterAssemblyTests

#pragma mark - The enviroment for testing

- (void)setUp {
    [super setUp];

    self.assembly = [[AMFNameIconSetterAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Testing of the module's parts assembly

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [AMFNameIconSetterViewController class];
    NSArray *protocols = @[
                           @protocol(AMFNameIconSetterViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewNameIconSetter];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [AMFNameIconSetterPresenter class];
    NSArray *protocols = @[
                           @protocol(AMFNameIconSetterModuleInput),
                           @protocol(AMFNameIconSetterViewOutput),
                           @protocol(AMFNameIconSetterInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterNameIconSetter];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [AMFNameIconSetterInteractor class];
    NSArray *protocols = @[
                           @protocol(AMFNameIconSetterInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly interactorNameIconSetter];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [AMFNameIconSetterRouter class];
    NSArray *protocols = @[
                           @protocol(AMFNameIconSetterRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerNameIconSetter];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
