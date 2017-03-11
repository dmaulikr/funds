//
//  AMFPageChooserInteractor.h
//  funds
//
//  Created by Michael Artuerhof on 11/03/2017.
//  Copyright © 2017 micartu. All rights reserved.
//

#import "AMFPageChooserInteractorInput.h"

@protocol AMFDataSupplyProtocol;
@protocol AMFPageChooserInteractorOutput;

@interface AMFPageChooserInteractor : NSObject <AMFPageChooserInteractorInput>

/**
 data source to be used for showing contents
 */
@property (nonatomic, strong) id<AMFDataSupplyProtocol> dataSupply;

/**
 what's selected
 */
@property (nonatomic, weak) id<AMFPageChooserInteractorOutput> output;

@end
