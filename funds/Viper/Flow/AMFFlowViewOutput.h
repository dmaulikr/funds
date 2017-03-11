//
//  AMFFlowViewOutput.h
//  funds
//
//  Created by Michael on 08.03.17.
//  Copyright © 2017 micartu. All rights reserved.
//

@protocol AMFFlowViewOutput <NSObject>

-(void)setupView;

/**
 user clicked the add button (upper-right element in navigation pane)
 */
-(void)addClicked;

/**
 user selected a cell with index
 */
- (void)cellSelected: (NSUInteger) index;

/**
 user wants to delete a cell with number index
 */
- (void)cellToDelete: (NSUInteger) index;

/**
 user wants to select another page
 */
- (void) choosePage;

/**
 Method reports to presenter that it's ready for work
 */
- (void)didTriggerViewReadyEvent;

@end
