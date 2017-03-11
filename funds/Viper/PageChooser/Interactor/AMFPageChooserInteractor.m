//
//  AMFPageChooserInteractor.m
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserInteractor.h"
#import "AMFDataSupplyProtocol.h"
#import "AMFPageChooserInteractorOutput.h"

@implementation AMFPageChooserInteractor

#pragma mark - Методы AMFPageChooserInteractorInput

-(void) receiveAllPages {
    [self.dataSupply fetchAllPagesWithBlock:^(NSArray *pages) {
        dispatch_async(dispatch_get_main_queue(), ^ {
            [self.output receivedPages:pages];
        });
    }];
}

@end
