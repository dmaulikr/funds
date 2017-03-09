//
//  AMFDataSupplier.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AMFDataSupplyProtocol.h"
#import "AMFStorageHandlerProtocol.h"

@interface AMFDataSupplier : NSObject<AMFDataSupplyProtocol>

@property (nonatomic, strong) id<AMFStorageHandlerProtocol> handler;

-(void)populateContentsWithCSVFile:(NSString*)file;

@end
