//
//  AMFAddRecordAssemblyTests.m
//  funds
//
//  Created by Michael Artuerhof on 16/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "AMFAddRecordAssembly.h"
#import "AMFAddRecordAssembly_Testable.h"

#import "AMFAddRecordViewController.h"
#import "AMFAddRecordPresenter.h"
#import "AMFAddRecordInteractor.h"
#import "AMFAddRecordRouter.h"

@interface AMFAddRecordAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) AMFAddRecordAssembly *assembly;

@end

@implementation AMFAddRecordAssemblyTests

#pragma mark - The enviroment for testing

- (void)setUp {
    [super setUp];

    self.assembly = [[AMFAddRecordAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Testing of the module's parts assembly

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [AMFAddRecordViewController class];
    NSArray *protocols = @[
                           @protocol(AMFAddRecordViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewAddRecord];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [AMFAddRecordPresenter class];
    NSArray *protocols = @[
                           @protocol(AMFAddRecordModuleInput),
                           @protocol(AMFAddRecordViewOutput),
                           @protocol(AMFAddRecordInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterAddRecord];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [AMFAddRecordInteractor class];
    NSArray *protocols = @[
                           @protocol(AMFAddRecordInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly interactorAddRecord];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [AMFAddRecordRouter class];
    NSArray *protocols = @[
                           @protocol(AMFAddRecordRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerAddRecord];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
