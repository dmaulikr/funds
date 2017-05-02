//
//  AMFEditCategoryAssemblyTests.m
//  funds
//
//  Created by Michael Artuerhof on 02/05/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <RamblerTyphoonUtils/AssemblyTesting.h>
#import <Typhoon/Typhoon.h>

#import "AMFEditCategoryAssembly.h"
#import "AMFEditCategoryAssembly_Testable.h"

#import "AMFEditCategoryViewController.h"
#import "AMFEditCategoryPresenter.h"
#import "AMFEditCategoryInteractor.h"
#import "AMFEditCategoryRouter.h"

@interface AMFEditCategoryAssemblyTests : RamblerTyphoonAssemblyTests

@property (nonatomic, strong) AMFEditCategoryAssembly *assembly;

@end

@implementation AMFEditCategoryAssemblyTests

#pragma mark - The enviroment for testing

- (void)setUp {
    [super setUp];

    self.assembly = [[AMFEditCategoryAssembly alloc] init];
    [self.assembly activate];
}

- (void)tearDown {
    self.assembly = nil;

    [super tearDown];
}

#pragma mark - Testing of the module's parts assembly

- (void)testThatAssemblyCreatesViewController {
    // given
    Class targetClass = [AMFEditCategoryViewController class];
    NSArray *protocols = @[
                           @protocol(AMFEditCategoryViewInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly viewEditCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesPresenter {
    // given
    Class targetClass = [AMFEditCategoryPresenter class];
    NSArray *protocols = @[
                           @protocol(AMFEditCategoryModuleInput),
                           @protocol(AMFEditCategoryViewOutput),
                           @protocol(AMFEditCategoryInteractorOutput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(interactor),
                              RamblerSelector(view),
                              RamblerSelector(router)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly presenterEditCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesInteractor {
    // given
    Class targetClass = [AMFEditCategoryInteractor class];
    NSArray *protocols = @[
                           @protocol(AMFEditCategoryInteractorInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(output)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly interactorEditCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

- (void)testThatAssemblyCreatesRouter {
    // given
    Class targetClass = [AMFEditCategoryRouter class];
    NSArray *protocols = @[
                           @protocol(AMFEditCategoryRouterInput)
                           ];
    NSArray *dependencies = @[
                              RamblerSelector(transitionHandler)
                              ];
    RamblerTyphoonAssemblyTestsTypeDescriptor *descriptor = [RamblerTyphoonAssemblyTestsTypeDescriptor descriptorWithClass:targetClass
                                                                                                              andProtocols:protocols];

    // when
    id result = [self.assembly routerEditCategory];

    // then
    [self verifyTargetDependency:result
                  withDescriptor:descriptor
                    dependencies:dependencies];
}

@end
