//
//  AMFStorageHandlerProtocol.h
//  funds
//
//  Created by Michael on 09.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFCashProtocol;
@protocol AMFPageProtocol;

@protocol AMFStorageHandlerProtocol <NSObject>

-(void) initStorage;
-(void) addRecord:(id<AMFCashProtocol>)rec;
-(void) addRecords:(NSArray*)ar;
-(NSArray*) grabRecordsForPage:(id<AMFPageProtocol>)page;

@end
