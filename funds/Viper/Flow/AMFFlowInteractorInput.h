//
//  AMFFlowInteractorInput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFPageProtocol;

@protocol AMFFlowInteractorInput <NSObject>

/**
 asks for records with page
 */
- (void)askForDataWithPage:(id<AMFPageProtocol>)page;

/**
 if we do not have any page selected try to find one...
 */
- (void)askForAnyValidPage;

/**
 * user wants remove a record
 */
- (void)removeCashFlowWithIndex:(NSInteger)index;

@end
