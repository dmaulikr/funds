//
//  AMFFlowInteractorOutput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFPageProtocol;

@protocol AMFFlowInteractorOutput <NSObject>

-(void) receivedRecords:(NSArray*) records;
-(void) receivedValidPage:(id<AMFPageProtocol>) page;

@end
