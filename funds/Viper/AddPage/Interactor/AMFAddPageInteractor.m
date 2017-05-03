//
//  AMFAddPageInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 22/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFAddPageInteractor.h"
#import "AMFStorageHandlerProtocol.h"
#import "AMFPagePlain.h"

#import "AMFAddPageInteractorOutput.h"

@implementation AMFAddPageInteractor

#pragma mark - Методы AMFAddPageInteractorInput

- (void)createPageWithName:(NSString*)pageName {
    AMFPagePlain *page = [[AMFPagePlain alloc] init];
    page.name = pageName;
    [self.storage addPage:page];
}

- (void)updatePage:(id<AMFPageProtocol>)page withName:(NSString*)name {
    [self.storage updatePage:page withName:name];
}

@end
