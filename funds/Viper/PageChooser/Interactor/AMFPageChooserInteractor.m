//
//  AMFPageChooserInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserInteractor.h"
#import "AMFPageChooserInteractorOutput.h"
#import "AMFStorageHandlerProtocol.h"

@implementation AMFPageChooserInteractor

#pragma mark - Методы AMFPageChooserInteractorInput

- (void)receiveAllPages {
    NSArray *pages = [self.storage grabAllPages];
    [self.output receivedPages:pages];
}

- (void)deletePage:(id<AMFPageProtocol>)page {
    [self.storage removePage:page];
}

@end
